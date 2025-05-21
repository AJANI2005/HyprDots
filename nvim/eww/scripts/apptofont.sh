#!/bin/bash

# Returns a font icon (Nerd Fonts/Font Awesome) for the given app name

APP="${1,,}" # Convert to lowercase for case-insensitive matching

declare -A APP_ICONS=(
  # Browsers
  ["firefox"]=""
  ["chrome"]=""
  ["chromium"]=""
  ["brave"]=""
  ["opera"]=""
  ["vivaldi"]=""

  # Communication
  ["discord"]=""
  ["slack"]=""
  ["thunderbird"]=""
  ["mailspring"]=""
  ["telegram"]=""
  ["signal"]=""

  # Media
  ["spotify"]=""
  ["vlc"]="嗢"
  ["mpv"]=""
  ["kodi"]=""

  # Editors/IDEs
  ["code"]=""
  ["vscode"]=""
  ["subl"]=""
  ["atom"]=""
  ["gedit"]=""
  ["nano"]=""
  ["vim"]=""
  ["neovim"]=""
  ["kitty"]=""

  # Graphics
  ["gimp"]=""
  ["inkscape"]=""
  ["krita"]=""

  # Office
  ["libreoffice"]=""
  ["soffice"]="" # LibreOffice executable
  ["evince"]=""  # Document viewer

  # Terminals
  ["gnome-terminal"]=""
  ["konsole"]=""
  ["terminator"]=""
  ["tilix"]=""
  ["alacritty"]=""

  # File managers
  ["nautilus"]=""
  ["dolphin"]=""
  ["thunar"]=""
  ["pcmanfm"]=""

  # System tools
  ["htop"]=""
  ["gnome-system-monitor"]=""
  ["gparted"]=""
  ["bleachbit"]=""

  # Development tools
  ["git"]=""
  ["github"]=""
  ["gitkraken"]=""
  ["docker"]=""

  # Other common apps
  ["obs"]=""
  ["obs-studio"]=""
  ["steam"]=""
  ["minecraft"]=""
  ["virtualbox"]=""
  ["zoom"]=""
  ["teams"]=""
)

# Check if we have an icon for this app
if [[ -n "${APP_ICONS[$APP]}" ]]; then
  echo "${APP_ICONS[$APP]}"
  exit 0
fi

# Try to match partial names if exact match not found
for app_name in "${!APP_ICONS[@]}"; do
  if [[ "$APP" == *"$app_name"* ]]; then
    echo "${APP_ICONS[$app_name]}"
    exit 0
  fi
done

echo ""
# No match found
exit 1
