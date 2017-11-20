#!/bin/sh

pidfile=${pidfile:-"/tmp/pid"}
runlevel=${LOG_LEVEL:-"INFO"}

# INFO
info () {
	echo " [INFO] $1"
}
export -f info

infolog () {
	echo " [INFO] $1">>${pidfile}
}
export -f infolog

# INFO
debug () {
	if [ "${runlevel}" = "DEBUG"]; then
		echo " [DEBUG] $1"
	fi
}
export -f debug
debuglog () {
	if [ "${runlevel}" = "DEBUG"]; then
		echo " [DEBUG] $1">>${pidfile}
	fi
}
export -f debuglog

# WARNING
warn () {
	echo " [WARNING] $1"
}
export -f warn
warnlog () {
	echo " [WARNING] $1">>${pidfile}
}
export -f warnlog

# ERROR
error () {
	echo " [ERROR] $1"
}
export -f error
errorlog () {
	echo " [ERROR] $1">>${pidfile}
}
export -f errorlog
