#!/bin/bash

# This script expects the following to be installed:
#   /opt/st/stm32cubeide...
#   ~/STM32Cube/Repository/STM32Cube_FW_...

# Echo commands and exit on first failure
set -ex

# Some convenience variables.
# Change these if you'd like to use different versions.
ide=stm32cubeide_1.4.0
fw=STM32Cube_FW_F4_V1.25.1

# default directory permissions don't allow re-writing into some directories
rm -rf $ide $fw

# Copy large file inputs locally.
# Unfortunately, we can't just symlink to these,
# since Docker won't follow symlinks.
cp -r /opt/st/$ide .
cp -r ~/STM32Cube/Repository/$fw .

# Build the image
docker build --build-arg ide=$ide --build-arg fw=$fw .

# Push to dockerhub by tagging the resulting image, e.g.:
#   docker tag <img> milesfrain/stm32cubeide1.4.0:F4_V1.25.1
# Then upload:
#   docker push milesfrain/stm32cubeide1.4.0:F4_V1.25.1
