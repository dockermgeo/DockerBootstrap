#!/usr/bin/env bash

pidfile=${pidfile:-"/tmp/pid"}
runlevel=${LOG_LEVEL:-"INFO"}
rundate=$(date +'%Y.%m.%d-%H:%M:%S')


# INFO
info () {
	if [ "${runlevel}" != "ERROR" ]; then
		echo "[${rundate}] [INFO] dockerboot - $1"
	fi
}
infolog () {
	if [ "${runlevel}" != "ERROR" ]; then
		echo "[${rundate}] [INFO] dockerboot - $1">>${pidfile}
	fi
}

# INFO
debug () {
	if [ "${runlevel}" = "DEBUG" ]; then
		echo "[${rundate}] [DEBUG] dockerboot - $1"
	fi
}
debuglog () {
	if [ "${runlevel}" = "DEBUG" ]; then
		echo "[${rundate}] [DEBUG] dockerboot - $1">>${pidfile}
	fi
}

# WARNING
warn () {
	echo "[${rundate}] [WARNING] dockerboot - $1"
}
warnlog () {
	echo "[${rundate}] [WARNING] dockerboot - $1">>${pidfile}
}
warning () {
	echo "[${rundate}] [WARNING] dockerboot - $1"
}
warninglog () {
	echo "[${rundate}] [WARNING] dockerboot - $1">>${pidfile}
}

# ERROR
error () {
	echo "[${rundate}] [ERROR] dockerboot - $1"
}
errorlog () {
	echo "[${rundate}] [ERROR] dockerboot - $1">>${pidfile}
}
