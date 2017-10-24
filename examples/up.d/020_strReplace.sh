#!/bin/sh

if [ ! -f ${TARGET_FILE} ]; then
  error "${!TARGET_FILE} not exists!"
  exit 1;
fi
if [ -z ${VALUE} ]; then
  error "${!VALUE} not set!"
  exit 1;
fi
if [ -z ${FIND} ]; then
  error "${!FIND} not set!"
  exit 1;
fi

strReplace ${FIND} ${VALUE} ${TARGET_FILE}
