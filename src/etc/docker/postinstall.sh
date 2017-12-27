#!/usr/bin/env bash
. /etc/docker/modules/outstream.sh
#
postinstalldir=/etc/docker/postinstall.d

#
for installer in $(ls ${postinstalldir}/*.sh 2> /dev/null); do
  info "POST INSTALL -> $installer"
  . $ups
  if [ $? -gt 0 ]; then
    exit;
  fi
done
