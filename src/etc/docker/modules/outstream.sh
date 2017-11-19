#!/bin/sh

pidfile=${pidfile:-"/tmp/pid"}

# INFO
info () {
	echo " [INFO] $1"
}
infolog () {
	echo " [INFO] $1">>${pidfile}
}
startupinfo () {
	echo " [INFO] Startinfo { 'started':'$(date +'%Y.%m.%d-%H:%M:%S')', 'pid':'$(ps -ef|grep /app.sh  |grep -v grep |awk '{ print $2 }')' }">${pidfile}
}

# WARNING
warn () {
	echo " [WARNING] $1"
}
warnlog () {
	echo " [WARNING] $1">>${pidfile}
}

# ERROR
error () {
	echo " [ERROR] $1"
}
errorlog () {
	echo " [ERROR] $1">>${pidfile}
}
