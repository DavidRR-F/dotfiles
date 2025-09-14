#!/bin/bash

# Get all available sinks into an array
mapfile -t SINKS < <(pactl list short sinks | awk '{print $2}')

# Get the current default sink
CURRENT_SINK=$(pactl get-default-sink)

# Find the index of the current sink
CURRENT_INDEX=-1
for i in "${!SINKS[@]}"; do
  if [[ "${SINKS[$i]}" == "$CURRENT_SINK" ]]; then
    CURRENT_INDEX=$i
    break
  fi
done

# Calculate the index of the next sink
if [[ $CURRENT_INDEX -ge 0 ]]; then
  NEXT_INDEX=$(((CURRENT_INDEX + 1) % ${#SINKS[@]}))
  NEXT_SINK=${SINKS[$NEXT_INDEX]}
else
  echo "Current default sink not found in sink list."
  exit 1
fi

# Set the new default sink
pactl set-default-sink "$NEXT_SINK"

# Move all sink inputs to the new sink
for INPUT in $(pactl list short sink-inputs | awk '{print $1}'); do
  pactl move-sink-input "$INPUT" "$NEXT_SINK"
done

echo "Switched to: $NEXT_SINK"
