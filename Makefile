# SPDX-License-Identifier: Apache-2.0
#
# Copyright (c) 2021 Blue Clover Devices
#

PRJTAG := ly11-ble-fw

# Makefile default shell is /bin/sh which does not implement `source`.
SHELL := /bin/bash

BASE_PATH := $(realpath .)
DIST := $(BASE_PATH)/dist

.PHONY: default
default: build

.PHONY: GIT-VERSION-FILE
GIT-VERSION-FILE:
	@sh ./GIT-VERSION-GEN
-include GIT-VERSION-FILE

VERSION_TAG := $(patsubst v%,%,$(GIT_DESC))

DOCKER_BUILD_ARGS :=
DOCKER_BUILD_ARGS += --network=host

DOCKER_RUN_ARGS :=
DOCKER_RUN_ARGS += --network=none

ZEPHYR_TAG := 3.3.0
ZEPHYR_SYSROOT := /usr/src/zephyr-$(ZEPHYR_TAG)/zephyr
ZEPHYR_USRROOT := $(HOME)/src/zephyr-$(ZEPHYR_TAG)/zephyr

# Determine Zephyr Root
ZEPHYR_ROOT :=
ifneq "$(wildcard $(ZEPHYR_SYSROOT) )" ""
  # If ZEPHYR_SYSROOT exists, we use it.
  ZEPHYR_ROOT = $(ZEPHYR_SYSROOT)
else
  # Otherwise, we look for ZEPHYR_USRROOT
  ifneq "$(wildcard $(ZEPHYR_USRROOT) )" ""
    ZEPHYR_ROOT = $(ZEPHYR_USRROOT)
  endif
endif

ZEPHYR_BOARD_ROOT := $(BASE_PATH)

BOARDS :=
BOARDS += nrf52840dk_nrf52840
BOARDS += nrf52840dongle_nrf52840

TARGETS := $(patsubst %,build.%/hci_usb_h4/zephyr/zephyr.hex,$(BOARDS))
TARGETS += build.nrf52840dongle_nrf52840/hci_usb_h4/zephyr/zephyr-dfu.zip

build.%/hci_usb_h4/zephyr/zephyr.hex: check-zephyr
	source $(ZEPHYR_ROOT)/zephyr-env.sh ; \
	west build --build-dir build.$*/hci_usb_h4 --pristine auto \
	--board $* $(ZEPHYR_ROOT)/samples/bluetooth/hci_usb_h4 \
	-DCONFIG_BT_CTLR_DTM_HCI=y

%/zephyr-dfu.zip: %/zephyr.hex
	nrfutil pkg generate --hw-version 52 --sd-req=0x00 \
	  --application $+ \
	  --application-version 1 $@

.PHONY: versions
versions:
	@echo "GIT_DESC: $(GIT_DESC)"
	@echo "VERSION_TAG: $(VERSION_TAG)"

.PHONY: build
build: $(TARGETS)

.PHONY: distclean
distclean: clean
	-rm -rf dist

.PHONY: clean
clean:
	-rm -rf $(BINS) build build.*

.PHONY: dist-prep
dist-prep:
	-install -d $(DIST)

.PHONY: dist-clean
dist-clean:
	-rm -rf $(DIST)

.PHONY: check-zephyr
check-zephyr:
ifeq "$(wildcard $(ZEPHYR_ROOT) )" ""
	$(error No Zephyr root found: Neither $(ZEPHYR_SYSROOT) or $(ZEPHYR_USRROOT) exist!)
endif

.PHONY: dist
dist: dist-clean dist-prep build
	install -m 666 build.nrf52840dk_nrf52840/hci_usb_h4/zephyr/zephyr.hex dist/hci_usb_h4-nrf52840dk-$(ZEPHYR_TAG).hex
	install -m 666 build.nrf52840dongle_nrf52840/hci_usb_h4/zephyr/zephyr.hex dist/hci_usb_h4-nrf52840dongle-$(ZEPHYR_TAG).hex
	install -m 666 build.nrf52840dongle_nrf52840/hci_usb_h4/zephyr/zephyr-dfu.zip dist/hci_usb_h4-nrf52840dongle-$(ZEPHYR_TAG)-dfu.zip

.PHONY: docker
docker: dist-prep
	docker build $(DOCKER_BUILD_ARGS) -t "bcdevices/$(PRJTAG)" .
	-@docker rm -f "$(PRJTAG)-$(VERSION_TAG)" 2>/dev/null
	docker run  $(DOCKER_RUN_ARGS) --name "$(PRJTAG)-$(VERSION_TAG)"  -t "bcdevices/$(PRJTAG)" \
	 /bin/bash -c "make dist"
	docker cp "$(PRJTAG)-$(VERSION_TAG):/usr/src/dist" $(BASE_PATH)
