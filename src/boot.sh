#!/bin/sh

mdir=/etc/docker/modules
updir=/etc/docker/up.d
for mod in $(ls ${mdir}/*.sh); do
  chmod a+x ${mdir}/$mod
  echo " * Sourcing ${mdir}/$mod"
  . ${mdir}/$mod
done
#
# INIT
#
for ups in $(ls ${updir}/*.sh); do
  chmod a+x ${rp}/$updir
  ${rp}/$updir
done

#
# Starting
#
chmod a+x /app.sh
/app.sh
