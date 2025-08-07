#!/bin/bash

# openttd
ls "openttd-.*-linux-generic-amd64.tar.xz" || (
   BINURL=$(curl https://www.openttd.org/downloads/openttd-releases/latest | egrep -o "\/\/cdn.openttd.org/openttd-releases/.*/openttd-.*-linux-generic-amd64.tar.xz")
   [[ -z "$BINURL" ]] && echo "failed to get binary URL" && exit 1

   wget https:$BINURL
)
tar --strip-components=1 -xf openttd-*-linux-generic-amd64.tar.xz -C .

# opengfx
ls opengfx*-all.zip || (
   BINURL=$(curl https://www.openttd.org/downloads/opengfx-releases/latest | egrep -o "\/\/cdn.openttd.org/opengfx-releases/.*/opengfx-.*-all.zip")
   [[ -z "$BINURL" ]] && echo "failed to get gfx URL" && exit 2

   wget https:$BINURL
)
7z x 'opengfx*.zip'
mkdir -p /usr/games/openttd/baseset/opengfx/
tar -C /usr/games/openttd/baseset/opengfx/ -xf opengfx*.tar
