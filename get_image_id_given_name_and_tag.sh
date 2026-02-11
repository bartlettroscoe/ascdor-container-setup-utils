#!/bin/bash
#
# Get the container image ID given a container <image-name>:<image-tag>
#
#   ./get_image_id_given_name_and_tag.sh <image-name>:<image-tag>
#

image_and_tag_regex=$1; shift
#echo "image_and_tag_regex = $image_and_tag_regex"

docker inspect --format='{{.Id}}' ${image_and_tag_regex}
