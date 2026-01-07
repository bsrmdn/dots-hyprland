#!/bin/bash

MON="eDP-1"  # Monitor name
ANGLE="$1"   # up, right, down, left
if [[ $1 == up ]]; then
  ANGLE=0
elif [[ $1 == right ]]; then
  ANGLE=3
elif [[ $1 == down ]]; then
  ANGLE=2
elif [[ $1 == left ]]; then
  ANGLE=1
else
  echo "Usage: $0 {up|right|down|left}"
  exit 1
fi

# Get active monitor info from hyprctl
info=$(hyprctl monitors -j | jq -r ".[] | select(.name == \"$MON\")")

# Extract values
res=$(echo "$info" | jq -r '.width')x$(echo "$info" | jq -r '.height')@$(echo "$info" | jq -r '.refreshRate')
pos=$(echo "$info" | jq -r '.x')x$(echo "$info" | jq -r '.y')
scale=$(echo "$info" | jq -r '.scale')

# Run the transform change
hyprctl keyword monitor "$MON,$res,${pos},$scale,transform,$ANGLE"
