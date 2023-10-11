# ly11-ble-fw

Firmware images for BLE dongles, allowing these to be used for
[BLE Testing](https://docs.pltcloud.com/TestPlanReference/ble/)
with the [PLT-300A](https://bcdevices.com/pages/plt-300a).

## Dongle Programming

- [nRF52840-DONGLE Programming instructions](https://docs.pltcloud.com/peripheral/ble/nrf52840-dongle/)

## Docker build

### Prerequisites

- Linux hosts or Apple Mac computer running macOS
- Docker

### Instructions

- `make docker` to end up with build artifacts in `dist/`

## Local build

### Prerequisites

- Linux hosts or Apple Mac computer running macOS
- [Getting Started Guide — Zephyr Project Documentation](https://docs.zephyrproject.org/latest/getting_started/index.html)
- [nrfutil](https://github.com/NordicSemiconductor/pc-nrfutil)

### Instructions

- `make dist` to end up with build artifacts in `dist/`
