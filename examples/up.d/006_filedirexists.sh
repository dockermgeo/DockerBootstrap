#!/bin/sh
. /etc/docker/modules/outstream.sh
if [ ! -e ${VAR_NAME} ]; then
  error "${!VAR_NAME} not exists!"
  exit 1;
fi
