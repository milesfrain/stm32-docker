Creates a docker image for stm32 CI.

Edit and run the `build.sh` script, then upload to dockerhub.

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
