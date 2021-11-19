# ly11-ble-fw

Firmware images for BLE dongles, for use with PLT-300A.

- Build platform: macOS, Linux
- Host platform: PLT-300A
- Target platform: nRF52840DK (PCA10056), nRF52840-DONGLE (PCA10059)

These firmware images are built from the 
[Bluetooth: HCI H4 over USB — Zephyr Project Documentation](https://docs.zephyrproject.org/2.7.0/samples/bluetooth/hci_usb_h4/README.html)
sample project of the [Zephyr](https://zephyrproject.org/) RTOS.

- [nRF52840-DONGLE Programming instuctions](docs/program-nrf52840-dongle.rst)

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
