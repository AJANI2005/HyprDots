#!/bin/bash

path="/home/ajani/Hypr/wallpapers"
CONFIG="/home/ajani/.config/rofi/config-wallpaper.rasi"

# List wallpapers and send to rofi
CHOICE=$(ls "$path" | rofi -config "$CONFIG" -dmenu -p "󰹑   Choose Wallpaper")

if [[ -n "$CHOICE" ]]; then
  # Set wallpaper using swww
  swww img "$path/$CHOICE" --transition-type center --transition-fps 60

  # Update cache
  cp "$path/$CHOICE" /home/ajani/.cache/current-wallpaper

  # Notify
  notify-send "Wallpaper changed to $CHOICE"

  # Set colorscheme
  wallust -s -q run "$path/$CHOICE"

  # Eww reload widgets
  eww reload
fi
