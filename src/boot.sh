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
  if [ $? > 0 ]; then
    exit;
  fi
done

#
# Starting app
#
echo "">/app.log
$(/app.sh &) >>/dev/null


#
# INIT postup.d
#
sleep ${POST_WATING_TIME};
for pups in $(ls ${postdir}/*.sh); do
  echo " * Starting POST-up.d $pups"
  $pups
done

tail -f /app.log
