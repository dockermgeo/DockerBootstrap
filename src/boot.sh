#!/bin/sh

mdir=/etc/docker/modules
updir=/etc/docker/up.d
postdir=/etc/docker/postup.d
POST_WATING_TIME=${POST_WATING_TIME:-10};

for mod in $(ls ${mdir}/*.sh); do
  echo " * Sourcing $mod"
  . $mod
done
#
# INIT up.d
#
for ups in $(ls ${updir}/*.sh); do
  echo " * Starting up.d $ups"
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
sleep 1
pidfile=/tmp/pit
touch ${pidfile}
echo "pid=$(ps -ef|grep nginx  |grep off|awk '{ print $2 }')">>${pidfile}

#
# INIT postup.d
#
sleep ${POST_WATING_TIME};
for pups in $(ls ${postdir}/*.sh); do
  echo " * Starting POST-up.d $pups"
  $pups
done

#
# Hold Session
#
#fg 1
tail -f ${pidfile}
