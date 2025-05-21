#!/bin/bash

running=$(pidof hyprsunset)

if [ -z "$running" ]; then
  hyprsunset -t 4000 &
  eww update nightmode=true
else
  killall hyprsunset
  eww update nightmode=false
fi
