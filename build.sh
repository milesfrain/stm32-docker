#!/bin/bash

# This script expects the following to be installed:
#   ~/st/stm32cubeide...
#   ~/STM32Cube/Repository/STM32Cube_FW_...

# Echo commands and exit on first failure
set -ex


# Some convenience variables.
# Change these if you'd like to use different versions.

# Note that applying an from update within the IDE will still
# keep the old version number in the path. Must reinstall the
# IDE to get the new path.
ide=stm32cubeide_1.5.1
# Don't version IDE destination, since version numbers in path
# don't necessarily reflect actual IDE version if updated locally.
# This causes incompatibilities with running CI locally.
ide_versionless=stm32cubeide

fw=STM32Cube_FW_F4_V1.25.2

# Where FW is copied from
fw_in=~/STM32Cube/Repository/$fw


# default directory permissions don't allow re-writing into some directories
rm -rf $ide_versionless $fw

# Copy large file inputs locally.
# Unfortunately, we can't just symlink to these,
# since Docker won't follow symlinks.
cp -r ~/st/$ide $ide_versionless

# Copy FW without the bloat. Saves 2 GB.
# Note that trailing slash is super important here.
rsync -a --filter='merge fw_filter.rules' $fw_in/ $fw
# Log size reduction for reference.
du -hs $fw_in
du -hs $fw

# Build the image
docker build --build-arg ide=$ide_versionless --build-arg fw=$fw .

# Push to dockerhub by tagging the resulting image, e.g.:
#   docker tag <img> milesfrain/stm32cubeide1.4.0:F4_V1.25.1
# Then upload:
#   docker push milesfrain/stm32cubeide1.4.0:F4_V1.25.1
