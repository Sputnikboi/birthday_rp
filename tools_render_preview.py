"""Minimal Minecraft item-model renderer, so model/UV problems can be seen
instead of guessed at. Boxes only, single-axis element rotation, z-buffered,
nearest-neighbour texture sampling.

Usage: render.py <model.json> <assets_root> <out.png> [yaw] [pitch] [uvmode]
"""
import json, math, sys, os
from PIL import Image

MODEL, ASSETS, OUT = sys.argv[1], sys.argv[2], sys.argv[3]
YAW   = float(sys.argv[4]) if len(sys.argv) > 4 else -35.0
PITCH = float(sys.argv[5]) if len(sys.argv) > 5 else 22.0
UVMODE = sys.argv[6] if len(sys.argv) > 6 else "a"

W = H = 420
SS = 2                        # supersample factor
W2, H2 = W * SS, H * SS

model = json.load(open(MODEL))

def load_tex(ref):
    ns, _, path = ref.partition(":")
    if not path:
        ns, path = "minecraft", ns
    p = os.path.join(ASSETS, ns, "textures", path + ".png")
    return Image.open(p).convert("RGBA") if os.path.exists(p) else None

texs = {}
for k, v in model.get("textures", {}).items():
    if not v.startswith("#"):
        t = load_tex(v)
        if t: texs[k] = t

def rot_axis(p, axis, ang, origin):
    if not ang:
        return p
    a = math.radians(ang)
    c, s = math.cos(a), math.sin(a)
    x, y, z = p[0]-origin[0], p[1]-origin[1], p[2]-origin[2]
    if axis == "x":   y, z = y*c - z*s, y*s + z*c
    elif axis == "y": x, z = x*c + z*s, -x*s + z*c
    else:             x, y = x*c - y*s, x*s + y*c
    return [x+origin[0], y+origin[1], z+origin[2]]

# Face definitions: 4 corners in the order MC lays out UV (u1,v1)=top-left of the
# face as seen from outside, going clockwise.
def face_quads(x0, y0, z0, x1, y1, z1):
    return {
        "north": [(x1,y1,z0), (x0,y1,z0), (x0,y0,z0), (x1,y0,z0)],
        "south": [(x0,y1,z1), (x1,y1,z1), (x1,y0,z1), (x0,y0,z1)],
        "west":  [(x0,y1,z0), (x0,y1,z1), (x0,y0,z1), (x0,y0,z0)],
        "east":  [(x1,y1,z1), (x1,y1,z0), (x1,y0,z0), (x1,y0,z1)],
        "up":    [(x0,y1,z0), (x1,y1,z0), (x1,y1,z1), (x0,y1,z1)],
        "down":  [(x0,y0,z1), (x1,y0,z1), (x1,y0,z0), (x0,y0,z0)],
    }

NORMALS = {"north": (0,0,-1), "south": (0,0,1), "west": (-1,0,0),
           "east": (1,0,0), "up": (0,1,0), "down": (0,-1,0)}

def uv_corners(uv, rotation):
    u1, v1, u2, v2 = uv
    c = [(u1,v1), (u2,v1), (u2,v2), (u1,v2)]     # tl, tr, br, bl
    r = ((rotation or 0) // 90) % 4
    return c[r:] + c[:r]

# Collect triangles
tris = []
for el in model.get("elements", []):
    x0, y0, z0 = el["from"]
    x1, y1, z1 = el["to"]
    quads = face_quads(x0, y0, z0, x1, y1, z1)
    r = el.get("rotation")
    for fname, fdata in el.get("faces", {}).items():
        if fname not in quads:
            continue
        key = fdata.get("texture", "").lstrip("#")
        tex = texs.get(key)
        if tex is None:
            continue
        uv = fdata.get("uv", [0, 0, 16, 16])
        uvc = uv_corners(uv, fdata.get("rotation"))
        pts = quads[fname]
        if r:
            pts = [rot_axis(list(p), r.get("axis","y"), r.get("angle",0), r.get("origin",[8,8,8])) for p in pts]
        n = NORMALS[fname]
        if r:
            n = rot_axis(list(n), r.get("axis","y"), r.get("angle",0), [0,0,0])
        shade = 0.62 + 0.38 * max(0.0, (n[0]*0.35 + n[1]*0.85 + n[2]*(-0.40)))
        tris.append((pts[0], pts[1], pts[2], uvc[0], uvc[1], uvc[2], tex, shade))
        tris.append((pts[0], pts[2], pts[3], uvc[0], uvc[2], uvc[3], tex, shade))

# Camera: yaw then pitch, orthographic
cy, sy = math.cos(math.radians(YAW)),   math.sin(math.radians(YAW))
cp, sp = math.cos(math.radians(PITCH)), math.sin(math.radians(PITCH))
def project(p):
    x, y, z = p[0]-8, p[1]-8, p[2]-8
    x, z = x*cy + z*sy, -x*sy + z*cy
    y, z = y*cp - z*sp, y*sp + z*cp
    sc = W2 / 26.0
    return (W2/2 + x*sc, H2/2 - y*sc, z)

img = Image.new("RGBA", (W2, H2), (24, 24, 28, 255))
px = img.load()
zbuf = [[-1e9]*W2 for _ in range(H2)]   # larger z == nearer in this projection

for (a, b, c, ua, ub, uc, tex, shade) in tris:
    pa, pb, pc = project(a), project(b), project(c)
    tw, th = tex.size
    tpx = tex.load()
    minx = max(0, int(min(pa[0], pb[0], pc[0])));  maxx = min(W2-1, int(max(pa[0], pb[0], pc[0]))+1)
    miny = max(0, int(min(pa[1], pb[1], pc[1])));  maxy = min(H2-1, int(max(pa[1], pb[1], pc[1]))+1)
    d = (pb[0]-pa[0])*(pc[1]-pa[1]) - (pc[0]-pa[0])*(pb[1]-pa[1])
    if abs(d) < 1e-9:
        continue
    for yy in range(miny, maxy+1):
        for xx in range(minx, maxx+1):
            w0 = ((pb[0]-pa[0])*(yy+0.5-pa[1]) - (xx+0.5-pa[0])*(pb[1]-pa[1])) / d
            w1 = ((xx+0.5-pa[0])*(pc[1]-pa[1]) - (pc[0]-pa[0])*(yy+0.5-pa[1])) / d
            if w0 < 0 or w1 < 0 or w0 + w1 > 1:
                continue
            zz = pa[2] + w1*(pb[2]-pa[2]) + w0*(pc[2]-pa[2])
            if zz <= zbuf[yy][xx]:
                continue
            u = ua[0] + w1*(ub[0]-ua[0]) + w0*(uc[0]-ua[0])
            v = ua[1] + w1*(ub[1]-ua[1]) + w0*(uc[1]-ua[1])
            sx = min(tw-1, max(0, int(u/16*tw)))
            sy_ = min(th-1, max(0, int(v/16*th)))
            col = tpx[sx, sy_]
            if col[3] < 8:
                continue
            zbuf[yy][xx] = zz
            px[xx, yy] = (int(col[0]*shade), int(col[1]*shade), int(col[2]*shade), 255)

img.resize((W, H), Image.LANCZOS).save(OUT)
print(f"rendered {os.path.basename(MODEL)} -> {OUT}  ({len(tris)} tris, yaw={YAW} pitch={PITCH})")
