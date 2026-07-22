#!/usr/bin/env bash
# Packages the birthday datapack + resourcepack and installs the datapack into the server world.
set -e
cd "$(dirname "$0")"

WORLD="$HOME/minecraft-server-fabric/FruitbowlWorlds5"
RP_ZIP="birthday_rp.zip"
DP_ZIP="birthday_dp.zip"

# 1. Zip resource pack (contents at zip root, NOT the folder itself)
(cd resourcepack && zip -qr "../$RP_ZIP" .)

# 2. Zip datapack and copy into the world's datapacks folder
(cd datapack && zip -qr "../$DP_ZIP" .)
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
