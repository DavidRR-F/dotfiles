#!/bin/bash

CLASS=${1:-discord}

CLASS_ID=$(xdotool search --onlyvisible --class "$CLASS" | head -n 1)

if [ -n "$CLASS_ID" ]; then
  # If Discord is visible, hide it
  xdotool windowunmap "$CLASS_ID"
else
  # Try to find a hidden Discord window
  HIDDEN_ID=$(xdotool search --class "$CLASS" | head -n 1)
  if [ -n "$HIDDEN_ID" ]; then
    xdotool windowmap "$HIDDEN_ID"
    xdotool windowactivate "$HIDDEN_ID"
  else
    "$CLASS" &
  fi
fi
