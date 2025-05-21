#!/bin/bash

# Usage: ./confirm_rofi.sh "command_to_run" "Optional Title"

cmd="$1"
title="${2:-Are you sure?}"  # Default title if not provided

# Show confirmation prompt
choice=$(echo -e "No\nYes" | rofi -dmenu -theme ~/.config/rofi/config-confirm.rasi -i -no-custom -p "$title")

# Run command if confirmed
[[ "$choice" == "Yes" ]] && eval "$cmd"
