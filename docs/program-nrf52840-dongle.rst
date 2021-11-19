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

#. Flash the `.zip` file onto the board.
   
   .. note::

      :file:`/dev/ttyACM0` is for Linux; it will be
      something like ``COMx`` on Windows, and something else on macOS.

   .. code-block:: console

      nrfutil dfu usb-serial -pkg nrf52840dongle-hci_usb_h4-2.7.0.zip -p /dev/ttyACM0

   When this command exits, observe the green LED on the board blinking,
   instead of the red LED used by the bootloader.

For more information, see `Nordic Semiconductor USB DFU`_.

References
**********

.. _nRF52840 Dongle website:
   https://www.nordicsemi.com/Software-and-Tools/Development-Kits/nRF52840-Dongle
.. _Nordic Semiconductor USB DFU:
   https://infocenter.nordicsemi.com/index.jsp?topic=%2Fcom.nordic.infocenter.sdk5.v15.2.0%2Fsdk_app_serial_dfu_bootloader.html
.. _nrfutil:
   https://github.com/NordicSemiconductor/pc-nrfutil
