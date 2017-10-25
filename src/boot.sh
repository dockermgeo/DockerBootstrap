#!/bin/sh

mdir=/etc/docker/modules
updir=/etc/docker/up.d
for mod in $(ls ${mdir}/*.sh); do
  chmod a+x $mod
  echo " * Sourcing $mod"
  . $mod
done
#
# INIT
#
for ups in $(ls ${updir}/*.sh); do
  chmod a+x $ups
  $ups
done

#
# Starting
#
chmod a+x /app.sh
/app.sh
