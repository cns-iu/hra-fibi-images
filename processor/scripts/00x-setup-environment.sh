#!/bin/bash

conda create --name bioformats python=3.8
conda activate bioformats
conda install -c ome bioformats2raw raw2ometiff
