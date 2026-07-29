#!/usr/bin/env bash
# Packages the birthday datapack + resourcepack and installs the datapack into the server world.
set -e
cd "$(dirname "$0")"

# Must match level-name in server.properties.
WORLD="$HOME/minecraft-server-fabric/birthday_world"
RP_ZIP="birthday_rp.zip"
DP_ZIP="birthday_dp.zip"

# Remove stale archives first: `zip -r` updates in place, so files deleted
# from the source tree would otherwise survive in the zip forever.
rm -f "$RP_ZIP" "$DP_ZIP"

# Build from a staging copy with normalised timestamps, and with -X to drop extra
# file attributes. Without this, zip records mtimes and every rebuild produces a
# different sha1 even when nothing changed - which silently desyncs
# resource-pack-sha1 in server.properties and locks players out.
HERE="$(pwd)"
STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT
cp -r resourcepack "$STAGE/rp"
cp -r datapack    "$STAGE/dp"
find "$STAGE" -exec touch -t 202601010000 {} +

# 1. Zip resource pack (contents at zip root, NOT the folder itself)
(cd "$STAGE/rp" && zip -qrX "$HERE/$RP_ZIP" .)

# 2. Zip datapack and copy into the world's datapacks folder
(cd "$STAGE/dp" && zip -qrX "$HERE/$DP_ZIP" .)
mkdir -p "$WORLD/datapacks"
cp "$DP_ZIP" "$WORLD/datapacks/"

# 3. SHA1 of resource pack zip for server.properties
SHA=$(sha1sum "$RP_ZIP" | cut -d' ' -f1)

echo "==================================================="
echo "Done! Datapack installed to: $WORLD/datapacks/$DP_ZIP"
echo ""
echo "Resource pack zip: $(pwd)/$RP_ZIP"
echo "SHA1: $SHA"
echo ""
echo "Now serve the zip over HTTP and set in server.properties:"
echo "  resource-pack=<direct URL to $RP_ZIP>"
echo "  resource-pack-sha1=$SHA"
echo "  resource-pack-prompt=Birthday pack! Please accept :)"
echo "  require-resource-pack=true   (optional, forces it)"
echo ""
echo "Then restart the server (or /reload + rejoin for datapack)."
echo "==================================================="
