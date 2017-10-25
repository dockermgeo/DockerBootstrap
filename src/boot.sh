#!/bin/sh

mdir=/etc/docker/modules
updir=/etc/docker/up.d
for mod in $(ls ${mdir}/*.sh); do
  chmod a+x $mod
  echo " * Sourcing $mod"
  . ${mdir}/$mod
done
#
# INIT
#
for ups in $(ls ${updir}/*.sh); do
  chmod a+x $updir
  $updir
done

#
# Starting
#
chmod a+x /app.sh
/app.sh
