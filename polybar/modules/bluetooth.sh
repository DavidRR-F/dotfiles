#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
  echo "%{F{{ blue }}}"
else
  if [ $(bluetoothctl info | grep 'Connected: yes' | wc -c) -eq 0 ]; then
    echo "%{F{{ peach }}}󰂲"
  fi
  echo "%{F{{ sky }}}"
fi
