nRF52840-DONGLE programming
###########################

The nRF52840-DONGLE board supports the following programming options:

- Using the factory-default nRF5 SDK bootloader
- Using MCUboot in serial recovery mode
- Using an external SWD programmer

These instructions describe programming using the nRF52 SDK bootloader, which the nRF52840-Dongle ships with from the factory.

For other methods, please refer to `nRF52840 Dongle — Zephyr Project Documentation <https://docs.zephyrproject.org/latest/boards/arm/nrf52840dongle_nrf52840/doc/index.html>`_.

These instructions cover two ways to program the device:

#. Using `Nordic nRF Connect for Desktop`_ to program the `hci_usb_h4-nrf52840dongle-2.7.0.hex` file.
#. Using `nrfutil`_ to program the `hci_usb_h4-nrf52840dongle-2.7.0-dfu.zip` file.

In both cases, you will first need to put the nRF52840-Dongle Board into the factory bootloader:

Put the nRF52840-Dongle Board into the Bootloader
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Reset the board into the Nordic bootloader by pressing the RESET button.

   The push button is on the far side of the board from the USB connector. Note
   that the button does not face up. You will have to push it from the outside
   in, towards the USB connector:

   .. image:: img/nRF52840_dongle_press_reset.svg
      :alt: Location of RESET button and direction of push

   The red LED should start a fade pattern, signalling the bootloader is
   running:

   .. image:: img/nRF52840_bootloader.gif
      :alt: Location of RESET button and direction of push

`Note: The nRF52840-Dongle Board ships with only the bootloader installed. If your nRF52840-Dongle is unused, it will already be in the bootloader.`

Using Nordic nRF Connect for Desktop
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Make sure `Nordic nRF Connect for Desktop`_ is installed.
#. If you haven't already, follow the directions above to put the nRF52840-Dongle into the factory-default bootloader. 
#. Open `Nordic nRF Connect for Desktop`_, and open "Programmer" tool from the main window. You may need to install it first.

   .. image:: img/01_main_window.png
      :alt: nRF Connect for Desktop main window, Programmer tool.

#. Click the "Select Device" button, and then select the nRF52840-Dongle, which will show up as "Open DFU Bootloader".

   .. image:: img/02_select_device.png
      :alt: Click the Select Device Button

   .. image:: img/03_open_dfu_bootloader.png
      :alt: Click the "Open DFU Bootloader" device.

#. Now, either click the "Add File" button to browse for the `hci_usb_h4-nrf52840dongle-2.7.0.hex` file, or drag it to the Drag & Drop area.

   .. image:: img/04_add_file.png
      :alt: Add File

#. With the `hci_usb_h4-nrf52840dongle-2.7.0.hex` file selected, you can now click the "Write" button to program the dongle.

   .. image:: img/05_write.png
      :alt: Click the "Write" button.

#. The LED on the dongle will blink more rapidly as it is programmed. When programming is complete, the device will disconnect from nRF Connect for Desktop. The LED will no longer blink after being programmed.
#. You can verify that the BLE firmware is running by looking for the USB device. Make sure that a device with PID/VID 0x000c/0x2fe3 is enumerating. On macOS, you can use the System Information tool:

   .. image:: img/06_system_information.png
      :alt: USB-DEV, with PID/VID 0x000c/0x2fe3.


Using nrfutil
~~~~~~~~~~~~~

#. Make sure `nrfutil`_ is installed before proceeding.

#. If you haven't already, follow the directions above to put the nRF52840-Dongle into the factory-default bootloader. 

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
.. _Nordic nRF Connect for Desktop:
   https://www.nordicsemi.com/Products/Development-tools/nRF-Connect-for-desktop
.. _nrfutil:
   https://github.com/NordicSemiconductor/pc-nrfutil
