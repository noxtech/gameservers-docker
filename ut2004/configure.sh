#!/bin/sh

# Usage: MAPVOTE_TYPE="AS,CTF" ./generate_mapvote_ini.sh

[[ -z $MAPVOTE_TYPE ]] && MAPVOTE_TYPE="DM"

MAP_DIR="./Maps"

# Prepare prefix array
IFS=',' read -r -a PREFIXES <<< "$MAPVOTE_TYPE"

# Find matching maps
MAPS=$(find "$MAP_DIR" -type f -iname '*.unr' | while read -r FILE; do
  BASENAME=$(basename "$FILE" .unr)
  for PREFIX in "${PREFIXES[@]}"; do
    case "$BASENAME" in
      "$PREFIX"-*) echo "$BASENAME" ;;
    esac
  done
done | sort)

# Output file header
{
  echo "[MVES.MV_MapList]"
  COUNT=0
  for MAP in $MAPS; do
    echo "MapList[$COUNT]=$MAP"
    COUNT=$((COUNT + 1))
  done
} > "System/MapVote.ini"

echo "MapVote.ini created with $COUNT maps"
