#!/bin/bash -eu

outputs=$(xrandr --listmonitors | tail -n +2 | cut -d' ' -f 6)
workspaces=$(i3-msg -t get_workspaces | jq -r '.[]name')

monitor_count=$(echo "$outputs" | wc -l)
workspace_count=$(echo "$workspaces" | wc -l)

workspace_list=($(echo "$workspaces" | tr '\n' ' '))
monitor_list=($(echo "$monitors" | tr '\n' ' '))

for ((i = 0; i < workspace_count; i++)); do
  workspace="${workspace_list[$i]}"
  monitor="${monitor_list[$((i % monitor_count))]}"
  i3-msg "workspace $workspace; move workspace to output $monitor" 
done
