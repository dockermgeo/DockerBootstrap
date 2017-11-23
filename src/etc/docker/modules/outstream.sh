#!/usr/bin/env bash

pidfile=${pidfile:-"/tmp/pid"}
runlevel=${LOG_LEVEL:-"INFO"}
rundate=$(date +'%Y.%m.%d-%H:%M:%S')


# INFO
info () {
	if [ "${runlevel}" != "ERROR" ]; then
		echo "[${rundate}] [INFO] dcboot $(hostname) - $1"
	fi
}
infolog () {
	if [ "${runlevel}" != "ERROR" ]; then
		echo "[${rundate}] [INFO] dcboot $(hostname) - $1">>${pidfile}
	fi
}

# INFO
debug () {
	if [ "${runlevel}" = "DEBUG" ]; then
		echo "[${rundate}] [DEBUG] dcboot $(hostname) - $1"
	fi
}
debuglog () {
	if [ "${runlevel}" = "DEBUG" ]; then
		echo "[${rundate}] [DEBUG] dcboot $(hostname) - $1">>${pidfile}
	fi
}

# WARNING
warn () {
	echo "[${rundate}] [WARNING] dcboot $(hostname) - $1"
}
warnlog () {
	echo "[${rundate}] [WARNING] dcboot $(hostname) - $1">>${pidfile}
}
warning () {
	echo "[${rundate}] [WARNING] dcboot $(hostname) - $1"
}
warninglog () {
	echo "[${rundate}] [WARNING] dcboot $(hostname) - $1">>${pidfile}
}

# ERROR
error () {
	echo "[${rundate}] [ERROR] dcboot $(hostname) - $1"
}
errorlog () {
	echo "[${rundate}] [ERROR] dcboot $(hostname) - $1">>${pidfile}
}
