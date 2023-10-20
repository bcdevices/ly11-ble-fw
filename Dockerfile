# SPDX-License-Identifier: Apache-2.0
#
# Copyright (c) 2020-2023 Blue Clover Devices

FROM ghcr.io/bcdevices/zephyr:v3.5.0-0

RUN pip3 install --no-cache-dir nrfutil

WORKDIR /usr/src/
## Copy everything (use .dockerignore to exclude)
COPY . /usr/src
