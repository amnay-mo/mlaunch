#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
  set -- mlaunch "$@" --dir /data --verbose
fi

if [ "$1" = 'mlaunch' ]; then
  if [ -f /data/.mlaunch_startup ] ; then
    echo 'Already initialized. Ignoring provided command!'
    mlaunch start --dir /data --verbose
  else
    $@ --dir /data --verbose
  fi
else
  exec "$@"
fi

sleep 2

if [ -d /data/replset ]; then
  tail -f /data/replset/*/mongod.log
elif [ -d /data/config ]; then
  tail -f /data/mongos.log /data/**/**/mongod.log
else
  tail -f /data/mongod.log
fi