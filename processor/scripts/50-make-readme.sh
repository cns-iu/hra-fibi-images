#!/bin/bash
source constants.sh

LIST=../docs/LISTING.md
echo "" > $LIST

write() {
  echo "$1" >> $LIST
}

write ""
write "## GIF Images (full size)"
write ""

find output -name "*.gif" | while IFS= read -r file; do
  label=$(echo "$file" | perl -pe 's/output\///g')
  path=$(echo "$file" | perl -pe 's/output\///g;s/\ /\%20/g;')
  write "* [$label](https://cdn.humanatlas.io/fibi-image-store/$path)"
done

write "## Cropped Images (smaller size)"
write ""
find output -name "*.jpg" | grep "thumb.jpg" | while IFS= read -r file; do
  label=$(echo "$file" | perl -pe 's/output\///g')
  path=$(echo "$file" | perl -pe 's/output\///g;s/\ /\%20/g;')
  write "* [$label](https://cdn.humanatlas.io/fibi-image-store/$path)"
done

write ""
write "## Cropped Images (full size)"
write ""

find output -name "*.jpg" | grep "thumb.jpg" | while IFS= read -r file; do
  label=$(echo "$file" | perl -pe 's/output\///g')
  path=$(echo "$file" | perl -pe 's/output\///g;s/\ /\%20/g;')
  write "* [$label](https://cdn.humanatlas.io/fibi-image-store/$path)"
done

write ""
write "## Full-Size Slide Images"
write ""

find output -name "*.ome.tif" | while IFS= read -r file; do
  label=$(echo "$file" | perl -pe 's/output\///g')
  path=$(echo "$file" | perl -pe 's/output\///g;s/\ /\+/g;')
  write "* [$label](https://avivator.gehlenborglab.org/?image_url=https://cdn.humanatlas.io/fibi-image-store/$path)"
done
