#
# Copyright (c) 2019-2021 Blue Clover Devices
#
# SPDX-License-Identifier: None
#

FROM ghcr.io/bcdevices/zephyr:2.7.0-1

RUN pip3 install --no-cache-dir nrfutil

WORKDIR /usr/src/

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
