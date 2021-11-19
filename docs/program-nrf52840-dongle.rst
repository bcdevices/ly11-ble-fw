nRF52840-DONGLE programming
###########################

The nRF52840-DONGLE board supports the following programming options:

- Using the factory-default nRF5 SDK bootloader
- Using MCUboot in serial recovery mode
- Using an external SWD programmer

These instructions describe programming using the nRF52 SDK bootloader
only.  For other methods, please
refer to `nRF52840 Dongle — Zephyr Project Documentation <https://docs.zephyrproject.org/latest/boards/arm/nrf52840dongle_nrf52840/doc/index.html>`_.

#. Make sure `nrfutil`_ is installed before proceeding.

#. Reset the board into the Nordic bootloader by pressing the RESET button.

   The push button is on the far side of the board from the USB connector. Note
   that the button does not face up. You will have to push it from the outside
   in, towards the USB connector:

   .. image:: img/nRF52840_dongle_press_reset.svg
      :alt: Location of RESET button and direction of push

   The red LED should start a fade pattern, signalling the bootloader is
   running.

#. Flash the DFU package onto the board.
   
   .. code-block:: shell

      nrfutil dfu usb-serial -pkg hci_usb_h4-nrf52840dongle-2.7.0-dfu.zip -p /dev/ttyACM0

   .. code-block:: console

      $ nrfutil dfu usb-serial -pkg hci_usb_h4-nrf52840dongle-2.7.0-dfu.zip -p /dev/ttyACM0
      [####################################]  100%
      Device programmed.
      $

   When this command exits, observe the red LED used by the bootloader stops blinking.


#. Re-insert the nRF52840 Dongle, and check if the dongle enumerates
   as a HCI H4 over USB device.

   .. code-block:: console

      $ lsusb
      Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
      Bus 001 Device 003: ID 04f2:b685 Chicony Electronics Co., Ltd Chicony USB2.0 Camera
      Bus 001 Device 004: ID 8087:0aaa Intel Corp.
      Bus 001 Device 029: ID 2fe3:000c ZEPHYR USB-DEV
      Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
      $

References
**********

- `nRF52840 Dongle website`_
- `Nordic Semiconductor USB DFU`_.

.. _nRF52840 Dongle website:
   https://www.nordicsemi.com/Software-and-Tools/Development-Kits/nRF52840-Dongle
.. _Nordic Semiconductor USB DFU:
   https://infocenter.nordicsemi.com/index.jsp?topic=%2Fcom.nordic.infocenter.sdk5.v15.2.0%2Fsdk_app_serial_dfu_bootloader.html
.. _nrfutil:
   https://github.com/NordicSemiconductor/pc-nrfutil
