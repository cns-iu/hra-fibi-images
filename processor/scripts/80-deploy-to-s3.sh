#!/bin/bash
source constants.sh

aws s3 sync --delete output/ s3://cdn-humanatlas-io/fibi-image-store/
