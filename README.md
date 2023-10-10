# ly11-ble-fw

Firmware images for BLE dongles, allowing these to be used for
[BLE Testing](https://docs.pltcloud.com/TestPlanReference/ble/)
with the [PLT-300A](https://bcdevices.com/pages/plt-300a).

Uses the HCI USB H4 interface provided by the Zephyr RTOS Bluetooth stack.

- [RF52840-DONGLE (PCA10059)](https://docs.pltcloud.com/peripheral/ble/nrf52840-dongle/)
  **hci_usb_h4** firmware image
  ([DFU](https://github.com/bcdevices/ly11-ble-fw/releases/download/v1.1.0/hci_usb_h4-nrf52840dongle-2.7.0-dfu.zip))
  ([.hex](https://github.com/bcdevices/ly11-ble-fw/releases/download/v1.1.0/hci_usb_h4-nrf52840dongle-2.7.0.hex))

- [nRF52840DK (PCA10056)](https://docs.zephyrproject.org/3.0.0/boards/arm/nrf52840dk_nrf52840/doc/index.html)
  **hci_usb_h4** firmware image
  ([.hex](https://github.com/bcdevices/ly11-ble-fw/releases/download/v1.1.0/hci_usb_h4-nrf52840dk-2.7.0.hex))

## Dongle Programming

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
