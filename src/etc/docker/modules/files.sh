#!/usr/bin/env bash


function file_delete () {
  f=$1
  if [ -d $f ]; then
    rm -vf $f
  fi
}

function file_touch () {
  f=$1
  d=$(dirname $f)

  if [ -f $f ]; then
    rm -vf $f
  fi

  if [ ! -d $d ]; then
    mkdir -p $d
  fi
  touch $f
}

function dir_delete () {
  dir=$1
  if [ -d $dir ]; then
    rm -Rvf $dir
  fi
}

function dir_delete_inner () {
  dir=$1
  if [ -d $dir ]; then
    rm -Rvf $dir/*
  fi
}
