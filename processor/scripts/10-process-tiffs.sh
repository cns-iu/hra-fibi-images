#!/bin/bash
set -e
source constants.sh

find Images -name "*NoAlpha*.tif" | while IFS= read -r tif; do
  ome="${tif%%.tif}.ome.tif"
  output=$(echo "$ome" | perl -pe 's/^Images/output/g')
  mkdir -p `dirname "$output"`
  echo `basename "$output"`
  time ./src/tiff-to-ome-tiff.sh "$tif" "$output"
done
