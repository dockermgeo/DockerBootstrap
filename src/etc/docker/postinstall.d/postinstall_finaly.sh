#!/usr/bin/env bash
stepsMax=2
#
. /etc/docker/modules/outstream.sh
stepCur=0

#
## Set ACC
infocounter "Setting global ACC's"
chmod -v a+x /etc/docker/up.d/*
chmod -v a+x /*.sh

#
## Cleanup
infocounter "Cleanup Global"
rm -Rvf /etc/docker/postinstall*
rm -Rvf /tmp/Docker* >>/dev/null
rm -Rvf /tmp/.* >>/dev/null
