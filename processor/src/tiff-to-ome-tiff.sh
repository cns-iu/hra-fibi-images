#!/bin/bash
set -e
source constants.sh

INPUT=$1
OUTPUT=$2
TEMP="${OUTPUT}.zarr"
OME="${TEMP}/OME/METADATA.ome.xml"
NUM_WORKERS=$(nproc)

mkdir -p "$TEMP"
rm -r "$TEMP"

bioformats2raw "$INPUT" "$TEMP" --tile_width 512 --tile_height 512 --max_workers $NUM_WORKERS --resolutions 6 --compression=zlib

sed -i "s/PhysicalSizeX=\"1.0\"/PhysicalSizeX=\"${RESOLUTION}\"/g" "$OME"
sed -i "s/PhysicalSizeY=\"1.0\"/PhysicalSizeY=\"${RESOLUTION}\"/g" "$OME"
sed -i 's/PhysicalSizeXUnit="?m"/PhysicalSizeXUnit="µm"/g' "$OME"
sed -i 's/PhysicalSizeYUnit="?m"/PhysicalSizeYUnit="µm"/g' "$OME"

# raw2ometiff "$TEMP" "$OUTPUT" --compression=zlib
raw2ometiff "$TEMP" "$OUTPUT" --compression=JPEG
