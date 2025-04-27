#!/bin/bash

CLASS=${1:-discord}

bspc subscribe node_add | while read -r _ _ _ wid; do
  class=$(xprop -id "$wid" WM_CLASS | awk -F '"' '{print $4}')
  if [[ "$class" == "$CLASS" ]]; then
    # Set to floating
    bspc node "$wid" -t floating
    xdotool windowmove "$wid" 1500 300
  fi
done
