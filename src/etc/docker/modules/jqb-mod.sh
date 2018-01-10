#!/usr/bin/env bash

F_JSON=${1:-"/tmp/.rm.json"}
function jqb_add () {
  F_JSON_TMP=$(dirname $1)/.$(basename $1).tmp
  if [ ! -f ${F_JSON_TMP} ]; then
    echo "" >${F_JSON_TMP}
  fi

  grep "${2}" ${F_JSON_TMP}
  if [ ${?} -eq 1 ]; then
      echo "\"$2\"," >>$F_JSON_TMP
  fi
}


function jqb_build_dataarray () {
  F_JSON=$1
  F_JSON_TMP=$(dirname $1)/.$(basename $1).tmp
  C_JSON_TMP=$(cat ${F_JSON_TMP})
  L=${#C_JSON_TMP}
  NL=$(($L-1))
  echo "{\"data\":[$(echo ${C_JSON_TMP:0:$NL})]}">${F_JSON}
  rm -f ${F_JSON_TMP}
}


function jqb_get () {
  getField=$1
  F_JSON=$2
  jq .${getField} ${F_JSON}
}
