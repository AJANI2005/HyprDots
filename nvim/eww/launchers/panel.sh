#!/bin/bash

active_monitor=$(hyprctl activeworkspace -j | jq -r '.monitorID')

opened=$(eww active-windows | grep "panel" | wc -l)

if [ "$opened" -gt 0 ]; then
  eww close panel
  exit 0
fi
eww open --screen "$active_monitor" panel
