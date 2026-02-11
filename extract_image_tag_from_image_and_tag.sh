#!/bin/bash
#
# Extract the image tag from <image-name>:<image-tag> taking into account
# possible ':' in the prefixes of the image name
#
#   ./extract_image_basename_from_image_and_tag.sh <image-name>:<image-tag>
#
# For example, given the input:
#
#   bartlettroscoe/trilinos-clang-19.1.6-openmpi-4.1.6:latest
#
# this will return:
#
#   latest
#

image_and_tag=$1; shift

echo "${image_and_tag##*:}"
