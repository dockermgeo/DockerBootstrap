#!/bin/sh

mdir=/etc/docker/modules
updir=/etc/docker/up.d

for mod in $(ls ${mdir}/*.sh); do
  echo " * Sourcing $mod"
  source $mod
done
#
# INIT
#
for ups in $(ls ${updir}/*.sh); do
  echo " * Starting $ups"
  $ups
done

#
# Starting
#
chmod a+x /app.sh
/app.sh
