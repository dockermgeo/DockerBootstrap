#!/bin/sh

pidfile=${pidfile:-"/tmp/pid"}
runlevel=${LOG_LEVEL:-"INFO"}

# INFO
info () {
	echo " dockerboot [INFO] $1"
}
infolog () {
	echo " dockerboot [INFO] $1">>${pidfile}
}

# INFO
debug () {
	if [ "${runlevel}" = "DEBUG" ]; then
		echo " dockerboot [DEBUG] $1"
	fi
}
debuglog () {
	if [ "${runlevel}" = "DEBUG" ]; then
		echo " dockerboot [DEBUG] $1">>${pidfile}
	fi
}

# WARNING
warn () {
	echo " dockerboot [WARNING] $1"
}
warnlog () {
	echo " dockerboot [WARNING] $1">>${pidfile}
}

# ERROR
error () {
	echo " dockerboot [ERROR] $1"
}
errorlog () {
	echo " dockerboot [ERROR] $1">>${pidfile}
}
