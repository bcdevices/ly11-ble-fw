#
# Copyright (c) 2019-2021 Blue Clover Devices
#
# SPDX-License-Identifier: Apache-2.0
#

FROM ghcr.io/bcdevices/zephyr:v3.5.0-0

RUN pip3 install --no-cache-dir nrfutil

WORKDIR /usr/src/

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
