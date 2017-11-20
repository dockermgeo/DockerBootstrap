#!/bin/sh

pidfile=${pidfile:-"/tmp/pid"}
runlevel=${LOG_LEVEL:-"INFO"}

# INFO
info () {
	echo " [INFO] $1"
}
infolog () {
	echo " [INFO] $1">>${pidfile}
}

# INFO
debug () {
	if [ "${runlevel}" = "DEBUG" ]; then
		echo " [DEBUG] $1"
	fi
}
debuglog () {
	if [ "${runlevel}" = "DEBUG" ]; then
		echo " [DEBUG] $1">>${pidfile}
	fi
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
