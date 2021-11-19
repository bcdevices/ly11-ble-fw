# ly11-ble-fw

Firmware for BLE dongles for use with PLT-300A.

- Build platform: macOS, Linux
- Host platform: PLT-300A
- Target platform: nRF52840DK, nRF52840-DONGLE

## Docker build

### Prerequisites

- Linux hosts or Apple Mac computer running macOS
- Docker

### Docker build instructions

- `make docker` to end up with build artifacts in `dist/`

## Local build

### Prerequisites

- Linux hosts or Apple Mac computer running macOS
- [Getting Started Guide — Zephyr Project Documentation](https://docs.zephyrproject.org/latest/getting_started/index.html)
- [nrfutil](https://github.com/NordicSemiconductor/pc-nrfutil)

### Local build instructions

- `make dist` to end up with build artifacts in `dist/`
