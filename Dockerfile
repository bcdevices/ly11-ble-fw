# SPDX-License-Identifier: None
#
# Copyright (c) 2020-2021 Blue Clover Devices

FROM ghcr.io/bcdevices/zephyr:2.7.0-1

RUN pip3 install --no-cache-dir nrfutil

WORKDIR /usr/src/
## Copy everything (use .dockerignore to exclude)
COPY . /usr/src
