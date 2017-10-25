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
chmod a+x -R $updir
for ups in $(ls ${updir}/*.sh); do
  $updir
done

#
# Starting
#
chmod a+x /app.sh
/app.sh
