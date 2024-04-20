#!/bin/bash  

GO_VERSION=1.22.1
NODE_VERSION=16
NERD_FONT_VERSION=3.2.1
NERD_FONT=Proto

wsl=false

command_not_exists() {
    if ! command -v $1 &>/dev/null; then
        return 0
    else
        return 1 
    fi 
}

install_packages() {
    
    sudo apt update -y
    sudo apt install -y curl
    sudo apt install -y wget
    sudo apt install -y unzip
    sudo apt install -y python3-pip
    sudo apt install -y stow
    sudo apt install -y tmux
    if [ -d "$tpm_dir"] then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi 
    if command_not_exists "nvm"; then
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
    fi
    if command_not_exists "pyenv"; then
        curl https://pyenv.run | bash
    fi
    if command_not_exists "go"; then
        wget -q "https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz" -O go.tar.gz
        sudo tar -C /usr/local -xzf go.tar.gz
        rm go.tar.gz
    fi

}

install_terminal() {
    if command_not_exists "starship"; then
        curl -sS https://starship.rs/install.sh | sh
    fi
    if command_not_exists "zoxide"; then
        curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    fi
    if [ "$1" = false ]; then
        # Install Nerd Font
        wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/v$NERD_FONT_VERSION/$NERD_FONT.zip" -O $NERD_FONT.zip
        mkdir -p ~/.local/share/fonts
        unzip -qq $NERD_FONT.zip -d ~/.local/share/fonts
        rm $NERD_FONT.zip
        fc-cache -f -v
        # Install Wezterm
        curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
        echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
        sudo apt install wezterm
    fi
}

install_deps() {
    go install golang.org/x/tools/cmd/goimports@latest
    go install golang.org/x/tools/gopls@latest
    go install github.com/a-h/templ/cmd/templ@latest
    nvm install v$NODE_VERSION
    npm install neovim tailwindcss typescript-language-server pyright -g
    pip3 install neovim pynvim jupyter-client jupytext cairosvg pnglatex plotly kaleido pyperclip nbformat  
}

while getopts ":w" opt; do
  case ${opt} in
    w )
      wsl=true
      ;;
    \? )
      echo "Invalid option: $OPTARG" 1>&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

# Check if running on WSL
if [ "$wsl" = true ]; then
  echo "Running on Windows Subsystem for Linux (WSL)."
  # Your WSL-specific actions here
else
  echo "Not running on Windows Subsystem for Linux (WSL)."
fi

install_packages
install_terminal $wsl
stow .
source ~/.bashrc
install_deps

