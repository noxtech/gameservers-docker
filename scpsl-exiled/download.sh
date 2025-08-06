#!/bin/bash

source /steam/scripts/zip-utils.sh

set -e

# https://github.com/ExMod-Team/EXILED/releases
VERSION=$(curl -s https://api.github.com/repos/ExMod-Team/EXILED/releases/latest | jq -r .tag_name)
curl -LO "https://github.com/ExMod-Team/EXILED/releases/download/${VERSION}/Exiled.tar.gz"
tar -xzvf Exiled.tar.gz
cp -r EXILED "${CONFIG_DIR}"
rm -fr EXILED

# https://github.com/ExMod-Team/Common-Utils
VERSION=$(curl -s https://api.github.com/repos/ExMod-Team/Common-Utils/releases/latest | jq -r .tag_name)
curl -LO "https://github.com/ExMod-Team/Common-Utils/releases/download/${VERSION}/Common.Utilities.dll"

# https://github.com/LumiFae/Timers/
VERSION=$(curl -s https://api.github.com/repos/LumiFae/Timers/releases/latest | jq -r .tag_name)
curl -LO "https://github.com/LumiFae/Timers/releases/download/${VERSION}/Timers-EXILED-HSM.dll"

# https://github.com/Konoaru384/RoleDisplayPlugin
VERSION=$(curl -s https://api.github.com/repos/Konoaru384/RoleDisplayPlugin/releases/latest | jq -r .tag_name)
curl -LO "https://github.com/Konoaru384/RoleDisplayPlugin/releases/download/${VERSION}/plugins.zip"
unzipAndMoveToDir plugins.zip "${CONFIG_DIR}/EXILED/Plugins/"

# https://github.com/MeowServer/HintServiceMeow/
VERSION=$(curl -s https://api.github.com/repos/MeowServer/HintServiceMeow/releases/latest | jq -r .tag_name)
curl -LO "https://github.com/MeowServer/HintServiceMeow/releases/download/${VERSION}/HintServiceMeow-Exiled.dll"

mkdir -p "${CONFIG_DIR}/EXILED/Plugins/"
mv *.dll "${CONFIG_DIR}/EXILED/Plugins/"
rm -f *.zip
