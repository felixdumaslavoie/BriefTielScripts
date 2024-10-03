#!/usr/bin/env bash

freq=10

if [ "$TERM" == "xterm-kitty" ];then
  echo "save kitty session every $freq seconds"
  while true; do
    kitty @ ls | python3 ./kitty-convert-dump.py > kitty-session.kitty
    sleep $freq
  done
else
  echo "This script does not make sense outside of kitty"
  exit 1
fi
