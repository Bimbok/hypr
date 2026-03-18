#!/usr/bin/env bash

# -- CONFIGURATION --
ART_PATH="/tmp/hyprlock_art.png"
DEFAULT_ART="/home/bimbok/arch/walls/zenitsu.png" # Fallback image
# -----------------

# Get metadata
STATUS=$(playerctl status 2>/dev/null)

if [ "$STATUS" = "Playing" ] || [ "$STATUS" = "Paused" ]; then
  TITLE=$(playerctl metadata xesam:title)
  ARTIST=$(playerctl metadata xesam:artist)
  ART_URL=$(playerctl metadata mpris:artUrl)

  # -- Handle Album Art --
  if [ -n "$ART_URL" ]; then
    if [[ "$ART_URL" == file://* ]]; then
      # Local file: remove 'file://' and copy
      SOURCE="${ART_URL#file://}"
      cp "$SOURCE" "$ART_PATH"
    elif [[ "$ART_URL" == http* ]]; then
      # Remote file: download if it changed
      # We use a hash check or just overwrite to keep it simple for lockscreen
      curl -s -o "$ART_PATH" "$ART_URL"
    fi
  else
    cp "$DEFAULT_ART" "$ART_PATH"
  fi

  # Limit text length to avoid overflow
  TITLE=$(echo "$TITLE" | cut -c 1-30)
  ARTIST=$(echo "$ARTIST" | cut -c 1-30)

  # Output JSON-like or just lines?
  # Hyprlock calls this script for text. We'll use arguments.
  if [ "$1" == "--title" ]; then
    echo "$TITLE"
  elif [ "$1" == "--artist" ]; then
    echo "$ARTIST"
  elif [ "$1" == "--art" ]; then
    echo "$ART_PATH"
  fi
else
  # If not playing, return empty or default
  if [ "$1" == "--art" ]; then
    echo "$DEFAULT_ART"
  else
    echo ""
  fi
fi
