#!/bin/bash

# args is monitor numbers
MONITORS=("$@")

for MONITOR in "${MONITORS[@]}"; do
  eww open --screen "$MONITOR" --id "bar$MONITOR" --toggle bar
done
