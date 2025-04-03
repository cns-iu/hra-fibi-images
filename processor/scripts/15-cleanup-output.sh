#!/bin/bash
set -e
source constants.sh

rm -rf output/*/*.zarr output/*/*/*.zarr
rmdir output/*
