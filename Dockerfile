# Create this image by running:
# ./build.sh

# The above script expects the host to have the following installed:
#   /opt/st/stm32cubeide...
#   ~/STM32Cube/Repository/STM32Cube_FW_...

FROM ubuntu:20.04

# Install mainstream applications
RUN apt update && apt install -y \
    python3 \
    clang-format \
    cpputest \
    make \
    g++ \
    lcov

#variables passed during build
ARG ide
# e.g. stm32cubeide_1.4.0
ARG fw
# e.g. STM32Cube_FW_F4_V1.25.1

# Convenience variables
ARG stm_repo=/usr/share/stm_repo

# Copy firmware
RUN mkdir -p $stm_repo
COPY $fw $stm_repo/$fw

# Copy ide
RUN mkdir -p /opt/st
COPY $ide /opt/st/$ide

