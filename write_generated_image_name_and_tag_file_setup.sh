# Source script to load functions for setting up the env var
# WRITE_GENERATED_IMAGE_NAME_AND_TAG_TO_FILE and creating and destroying temp
# files.

write_generated_image_name_and_tag_file_setup() {
  image_and_tag_file=$(mktemp)
  trap 'rm -f "${image_and_tag_file}"' EXIT
  export WRITE_GENERATED_IMAGE_NAME_AND_TAG_TO_FILE="${image_and_tag_file}"
  image_and_tag_file=
}

write_generated_image_name_and_tag_file_extract() {
  cat "${WRITE_GENERATED_IMAGE_NAME_AND_TAG_TO_FILE}"
}
