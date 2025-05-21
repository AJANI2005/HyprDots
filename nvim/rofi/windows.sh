#!/bin/bash

# Get list of windows with their workspace and app info
windows=$(hyprctl clients -j | jq -r '.[] | select(.workspace.id != -1) | "\(.workspace.id): \(.initialTitle) [\(.class)] (__HYPR_ID__\(.address))"')

# Use rofi to select a window
selection=$(echo "$windows" | rofi -dmenu -p "Windows" -matching fuzzy)

# Extract the window address from the selection
address=$(echo "$selection" | sed -n 's/.*__HYPR_ID__\(.*\))/\1/p')

# If a window address was selected, focus it
if [ -n "$address" ]; then
  hyprctl dispatch focuswindow address:"$address"
fi
