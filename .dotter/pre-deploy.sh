#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    touch $HOME/.dotfiles/.dotter/local.toml
    chmod +x "$HOME/.dotfiles/twm/i3/polyfix.sh"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    cat <<EOF > "$HOME/.dotfiles/.dotter/local.toml"
includes = [".dotter/include/mac.toml"]
packages = ["twm", "tui", "shell"]
EOF 
elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    cat <<EOF > "$HOME/.dotfiles/.dotter/local.toml"
includes = [".dotter/include/windows.toml"]
packages = ["twm", "tui", "shell", "vscode", "nvim"]
EOF 
fi
