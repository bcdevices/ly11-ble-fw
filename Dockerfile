# SPDX-License-Identifier: Apache-2.0
#
# Copyright (c) 2020-2021 Blue Clover Devices

FROM ghcr.io/bcdevices/zephyr:v3.3.0-7

RUN pip3 install --no-cache-dir nrfutil

WORKDIR /usr/src/
## Copy everything (use .dockerignore to exclude)
COPY . /usr/src
