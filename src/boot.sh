#!/bin/sh

#
# Variables
#
mdir=/etc/docker/modules
updir=/etc/docker/up.d
postdir=/etc/docker/postup.d
POST_WATING_TIME=${POST_WATING_TIME:-10};

. /etc/docker/modules/outstream.sh
for mod in $(ls ${mdir}/*.sh 2> /dev/null); do
  info "loading -> $mod"
  . $mod
done

#
# INIT up.d
#
for ups in $(ls ${updir}/*.sh 2> /dev/null); do
  info "up.d -> $ups"
  $ups
  if [ $? -gt 0 ]; then
    exit;
  fi
done

#
# Starting app
#
/app.sh &

#
# Write PID-File to stdout
#
startupinfo

#
# INIT postup.d
#
sleep ${POST_WATING_TIME};
for pups in $(ls ${postdir}/*.sh 2> /dev/null); do
  info "POST-up.d -> $pups"
  $pups
done

#
# Hold Session
#
#fg 1
pidfile=${pidfile:-"/tmp/pid"}
tail -f ${pidfile}
