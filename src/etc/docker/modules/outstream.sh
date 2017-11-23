#!/usr/bin/env bash

pidfile=${pidfile:-"/tmp/pid"}
runlevel=${LOG_LEVEL:-"INFO"}

# INFO
info () {
	if [ "${runlevel}" != "ERROR" ]; then
		echo " dockerboot [INFO] $1"
	fi
}
infolog () {
	if [ "${runlevel}" != "ERROR" ]; then
		echo " dockerboot [INFO] $1">>${pidfile}
	fi
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
warning () {
	echo " dockerboot [WARNING] $1"
}
warninglog () {
	echo " dockerboot [WARNING] $1">>${pidfile}
}

# ERROR
error () {
	echo " dockerboot [ERROR] $1"
}
errorlog () {
	echo " dockerboot [ERROR] $1">>${pidfile}
}
