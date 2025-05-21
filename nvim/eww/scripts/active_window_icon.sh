#!/bin/bash

active_window=$(hyprctl activewindow -j | jq -r '.class')
appicon=$HOME/.config/eww/scripts/apptofont.sh

if [[ -n "$active_window" ]]; then
  echo $($appicon "$active_window")
else
  exit 1
fi
