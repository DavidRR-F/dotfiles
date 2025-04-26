#!/bin/bash -eu

if [ "$(uname)" = "Linux" ]; then
  sudo chmod a+x ~/.config/bspwm/bspwmrc
  sudo chmod a+x ~/.config/sxhkd/sxhkdrc
  sudo chmod a+x ~/.local/bin/toggle-show-floating.sh
  sudo chmod a+x ~/.local/bin/floating-position.sh
  sudo chmod a+x ~/.config/polybar/modules/bluetooth.sh
  envsubst <~/.config/k9s/config.yaml >tmp.yaml
  mv tmp.yaml ~/.config/k9s/config.yaml
else # assume macos
  envsubst <~/Library/Application Support/k9s/config.yaml >tmp.yaml
  mv tmp.yaml ~/Library/Application Support/k9s/config.yaml
fi
