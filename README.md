Creates a docker image for stm32 CI.

Edit and run the `build.sh` script, then upload to dockerhub.

See the [stm32template](https://github.com/milesfrain/stm32template) readme for instructions on how to install the prerequesite IDE and FW.

Note that your local IDE installation will accumulate bloat (updates and plugins) as you use it, so if you'd like to minimize the size of these docker images, you can reinstall a pristine copy of the IDE in another path (e.g. `~/st/docker/stm32cubeide_1.5.1` instead of `~/st/stm32cubeide_1.5.1`), then edit the `build.sh` script to point to that pristine copy.

Contains:
- STM32CubeIDE
- Firmware for F4 line. Feel free to fork and customize for your purposes.
- `clang-format` for detecting formatting errors
- `cpputest` for unit testing
- `lcov` for code coverage

This image is used by the following GitHub action:
- https://github.com/milesfrain/stm32-action

Examples of projects that use this action:
- https://github.com/milesfrain/stm32template
- https://github.com/milesfrain/stm32demo (simplified)
