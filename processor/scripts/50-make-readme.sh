#!/bin/bash
source constants.sh

cp ../README.md ../docs/README.md
echo "" >> ../docs/README.md
echo "## Images" >> ../docs/README.md
echo "" >> ../docs/README.md

find output -name "*.ome.tif" | while IFS= read -r tif; do
  label=$(echo "$tif" | perl -pe 's/output\///g')
  path=$(echo "$tif" | perl -pe 's/output\///g;s/\ /\+/g;')
  echo "* [$label](https://avivator.gehlenborglab.org/?image_url=https://cdn.humanatlas.io/fibi-image-store/$path)" >> ../docs/README.md
done
