#!/bin/bash -eu

if [ "$(uname)" = "Linux" ]; then
  sudo chmod a+x ~/.config/bspwm/bspwmrc
  sudo chmod a+x ~/.config/sxhkd/sxhkdrc
fi
