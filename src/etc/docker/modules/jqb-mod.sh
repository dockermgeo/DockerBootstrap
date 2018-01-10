#!/usr/bin/env bash
#
# Version: 18
F_JSON=${1:-"/tmp/.rm.json"}
#

function jqb_add () {
  F_JSON_TMP=$(dirname $1)/.$(basename $1).tmp
  if [ ! -f ${F_JSON_TMP} ]; then
    echo "" >${F_JSON_TMP}
  else
    grep "${2}" ${F_JSON_TMP}
    if [ ${?} -eq 1 ]; then
        echo "\"$2\"," >>$F_JSON_TMP
    fi
  fi
}

function jqb_addString () {
  F_JSON_TMP=$(dirname $1)/.$(basename $1).tmp
  if [ ! -f ${F_JSON_TMP} ]; then
    echo "" >${F_JSON_TMP}
  else
    grep "${2}" ${F_JSON_TMP}
    if [ ${?} -eq 1 ]; then
        echo "\"$2\"," >>$F_JSON_TMP
    fi
  fi
}

function jqb_addObj () {
  F_JSON_TMP=$(dirname $1)/.$(basename $1).tmp
  if [ ! -f ${F_JSON_TMP} ]; then
    echo "" >${F_JSON_TMP}
  else
    grep "${2}" ${F_JSON_TMP}
    if [ ${?} -eq 1 ]; then
        echo "$2," >>$F_JSON_TMP
    fi
  fi
}

function jqb_build_dataarray () {
  F_JSON=$1
  F_JSON_TMP=$(dirname $1)/.$(basename $1).tmp
  C_JSON_TMP=$(cat ${F_JSON_TMP})
  L=${#C_JSON_TMP}
  NL=$(($L-1))
  echo "{\"data\":[$(echo ${C_JSON_TMP:0:$NL})]}">${F_JSON}
  nicer_json ${F_JSON}
  rm -f ${F_JSON_TMP}
}

function nicer_json() {
  jq . ${1} >${1}.nicer
  mv ${1}.nicer ${1}
}

function jqb_get () {
  getField=$1
  F_JSON=$2
  jq .${getField} ${F_JSON}
}
