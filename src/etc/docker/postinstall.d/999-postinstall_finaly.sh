#!/usr/bin/env bash
stepsMax=2
#
stepCur=0
. /etc/docker/modules/outstream.sh

#
## Set ACC
infocounter "Setting global ACC's"
chmod -v a+x /etc/docker/up.d/*
chmod -v a+x /*.sh

#
## Cleanup
infocounter "Cleanup Global's"
rm -Rvf /etc/docker/postinstall*
rm -Rvf /tmp/Docker* >>/dev/null
rm -Rvf /tmp/.* >>/dev/null
