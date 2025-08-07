#!/bin/bash

wget https://archive.org/download/ut2004-server/ut2004-server_archive.torrent
aria2c --seed-time=0 ut2004-server_archive.torrent
mv ut2004-server/dedicatedserver3369.3-bonuspack.zip .
7za x dedicatedserver3369.3-bonuspack.zip
mv dedicatedserver3369.3-bonuspack/* .
rm -fr \
  dedicatedserver3369.3-bonuspack \
  dedicatedserver3369.3-bonuspack.zip \
  ut2004-server \
  ut2004-server_archive.torrent
