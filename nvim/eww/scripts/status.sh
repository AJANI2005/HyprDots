#!/bin/bash

case "$1" in
--notif)
  dunstctl is-paused | grep -q true && echo "off" || echo "on"
  ;;
--sound)
  pactl get-sink-mute @DEFAULT_SINK@ | grep -q yes && echo "off" || echo "on"
  ;;
--bluetooth)
  rfkill list bluetooth | grep -i "Soft blocked:" | grep -q "yes" && echo "off" || echo "on"
  ;;
--wifi)
  nmcli radio wifi | grep -q enabled && echo "on" || echo "off"
  ;;
*)
  echo "Usage: $0 [--notif | --sound | --bluetooth | --wifi]"
  exit 1
  ;;
esac
