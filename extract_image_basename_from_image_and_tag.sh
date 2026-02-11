#!/bin/bash
#
# Extract the image base name minus prefixes from an input <image-name>:<image-tag>
#
#   ./extract_image_basename_from_image_and_tag.sh <image-name>:<image-tag>
#
# For example, given the input:
#
#   bartlettroscoe/trilinos-clang-19.1.6-openmpi-4.1.6:latest
#
# this will return:
#
#   trilinos-clang-19.1.6-openmpi-4.1.6
#

image_and_tag=$1; shift

echo "${image_and_tag}" | sed 's#.*/##; s/:.*//'
