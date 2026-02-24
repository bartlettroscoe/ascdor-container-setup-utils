#!/bin/bash
#
# Set up your env from what is mounted in /mounted_from_host/<personal-home-dir-setup>
#
# Just run:
#
#   $ cd ~
#   $ /mounted_from_host/<personal-home-dir-setup>/rab_container_tools/set_up_home_dir_env.sh

SCRIPT_BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "${SCRIPT_BASE_DIR}" == "${PWD}" ]] ; then
  echo "ERROR: Can't run form this dir!  Run from home dir in container (e.g. /root or /home/<user>)!"
  exit 1
fi

echo "Moving .bash_profile to .bash_profile.orig so we can symlink ours"
if [[ -f .bash_profile ]] ; then
  mv .bash_profile .bash_profile.orig
fi

${SCRIPT_BASE_DIR}/../symlink-files.sh

echo "Creating copy of .gitdist so edits do not affect the host machine"
rm .gitconfig
cp ${SCRIPT_BASE_DIR}/../.gitconfig .gitconfig
# NOTE: But you don't want to be changing ~/.gitconfig in the container because
# it will be lost the next time you run this container from the image.
