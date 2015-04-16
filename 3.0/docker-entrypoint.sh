#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
  mlaunch "$@" --dir /data --verbose
fi

if [ "$1" = 'mlaunch' ]; then
  $@ --dir /data --verbose
fi

sleep 2

if [[ $1 =~ replicaset || $1 =~ shard ]]; then
  exec tail -f /data/**/**/mongod.log
else
  exec tail -f /data/mongod.log
fi

