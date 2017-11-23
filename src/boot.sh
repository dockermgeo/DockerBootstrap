#!/usr/bin/env bash

#
# Variables
#
mdir=/etc/docker/modules
updir=/etc/docker/up.d
postdir=/etc/docker/postup.d
POST_WATING_TIME=${POST_WATING_TIME:-10};

#
# PREPARE
#
. /etc/docker/modules/outstream.sh
pidfile=${pidfile:-"/tmp/pid"}
echo "">${pidfile}


#
# INIT up.d
#
for ups in $(ls ${updir}/*.sh 2> /dev/null); do
  info "up.d -> $ups"
  . $ups
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
echo " [INFO] Startinfo { 'started':'$(date +'%Y.%m.%d-%H:%M:%S')', 'pid':'$(ps -ef|grep /app.sh  |grep -v grep |awk '{ print $2 }')' }">>${pidfile}

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
tail -f ${pidfile}
