#!/bin/bash

# Define the directory containing the maps
MAP_DIR="cstrike/maps"

# Define the output file
OUTPUT_FILE="cstrike/cfg/mapcycle.txt"

if [ -f "$OUTPUT_FILE" ]; then
  echo "mapcycle.txt detected, no generation required."
  exit 0
fi

# Initialize the randomize flag to false
RANDOMIZE=${RANDOMIZE_MAP_ORDER:-false}

# Create or clear the mapcycle.txt file
> "$OUTPUT_FILE"

# Collect all map names into an array
map_list=()
for map in "$MAP_DIR"/*.bsp; do
  map_name=$(basename "$map" .bsp)
  map_list+=("$map_name")
done

# Randomize the map list if the -r flag is set
if [ "$RANDOMIZE" = true ]; then
  map_list=($(shuf -e "${map_list[@]}"))
fi

# Write the map names to the mapcycle.txt file
for map_name in "${map_list[@]}"; do
  echo "$map_name" >> "$OUTPUT_FILE"
done

# Output success message
echo "mapcycle.txt has been generated with $(wc -l < "$OUTPUT_FILE") maps."
