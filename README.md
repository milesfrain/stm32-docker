Creates a docker image for stm32 CI.

Edit and run the `build.sh` script, then upload to dockerhub.

Contains:
* STM32CubeIDE
* Firmware for F4 line. Fee free to fork and customize for your purposes.
* `clang-format` for detecting formatting errors
* `cpputest` for unit testing
* `lcov` for code coverage

This image is used by the following GitHub action:
https://github.com/milesfrain/stm32-action

An example of a project that uses this action:
https://github.com/milesfrain/stm32demo
