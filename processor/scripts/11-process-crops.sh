#!/bin/bash
set -e
source constants.sh

# Convert cropped images to a full-size and 1920x image
find Images -name "*NoAlpha*.tif" | grep crop | while IFS= read -r tif; do
  jpg="${tif%%.tif}.jpg"
  thumb="${tif%%.tif}.thumb.jpg"
  output=$(echo "$jpg" | perl -pe 's/^Images/output/g')
  outputThumb=$(echo "$thumb" | perl -pe 's/^Images/output/g')
  mkdir -p "$(dirname "$output")"
  echo `basename "$output"`
  convert -quality 85 "$tif" "$output"
  convert -resize 1920x -quality 85 "$tif" "$outputThumb"
done

# Convert GIF images to an optimized full-size and 800x image
find Images -name "*.gif" | while IFS= read -r gif; do
  thumb="${gif%%.gif}.thumb.gif"
  output=$(echo "$gif" | perl -pe 's/^Images/output/g')
  outputThumb=$(echo "$thumb" | perl -pe 's/^Images/output/g')
  mkdir -p "$(dirname "$output")"
  echo `basename "$output"`
  convert "$gif" -layers Optimize "$output"
  convert "$gif" -coalesce -resize 800x -layers Optimize "$outputThumb"
done
