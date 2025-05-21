#!/bin/bash

case "$1" in
--notif)
  dunstctl set-paused toggle
  ;;
--sound)
  current=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
  if [ "$current" = "yes" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ 0
  else
    pactl set-sink-mute @DEFAULT_SINK@ 1
  fi
  ;;
--bluetooth)
  state=$(rfkill list bluetooth | grep -i "Soft blocked:" | awk '{print $3}')
  if [ "$state" = "yes" ]; then
    rfkill unblock bluetooth
  else
    rfkill block bluetooth
  fi
  ;;
--wifi)
  state=$(nmcli radio wifi)
  if [ "$state" = "enabled" ]; then
    nmcli radio wifi off
  else
    nmcli radio wifi on
  fi
  ;;
*)
  echo "Usage: $0 [--notif | --sound | --bluetooth | --wifi]"
  exit 1
  ;;
esac
