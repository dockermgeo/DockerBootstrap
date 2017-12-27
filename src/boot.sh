#!/usr/bin/env bash
. /etc/docker/modules/outstream.sh
#
# Variables
#
mdir=/etc/docker/modules
updir=/etc/docker/up.d
postinstalldir=/etc/docker/postinstall.d
postupdir=/etc/docker/postup.d
POST_WATING_TIME=${POST_WATING_TIME:-10};

#
# PREPARE
#
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
echo " [$(date +'%Y.%m.%d-%H:%M:%S')] [INFO] dockerboot - Startinfo { 'started':'$(date +'%Y.%m.%d-%H:%M:%S')', 'pid':'$(ps -ef|grep /app.sh  |grep -v grep |awk '{ print $2 }')' }">>${pidfile}

#
# INIT postup.d
#
sleep ${POST_WATING_TIME};
for pups in $(ls ${postupdir}/*.sh 2> /dev/null); do
  info "POST-up.d -> $pups"
  $pups
done

#
# Hold Session
#
#fg 1
tail -f ${pidfile}
