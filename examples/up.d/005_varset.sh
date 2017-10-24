#!/bin/sh

if [ -z ${VAR_NAME} ]; then
  error "${!VAR_NAME} not set!"
  exit 1;
fi
