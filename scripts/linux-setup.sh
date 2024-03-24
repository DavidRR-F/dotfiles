#!/bin/bash  

GO_VERSION=1.20.1
TERMIUM_VERSION=0.2.0
NERD_FONT_VERSION=3.1.1
NERD_FONT=Agave

# Function to detect the Linux distribution
detect_linux_distribution() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "$ID"
    elif [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        echo "$DISTRIB_ID"
    else
        echo "Unknown"
    fi
}

# Function to set package manager based on distribution
set_package_manager() {
    distro=$1
    case $distro in
        ubuntu|debian)
            PACKAGEMANAGER="apt"
            ;;
        fedora)
            PACKAGEMANAGER="dnf"
            ;;
        centos|rhel)
            PACKAGEMANAGER="yum"
            ;;
        *)
            echo "Unsupported distribution: $distro"
            exit 1
            ;;
    esac
}

install_packages() {
    sudo $PACKAGEMANAGER update -y
    sudo $PACKAGEMANAGER install -y curl
    sudo $PACKAGEMANAGER install -y wget
    sudo $PACKAGEMANAGER install -y unzip
    sudo $PACKAGEMANAGER install -y nodejs
    sudo $PACKAGEMANAGER install -y npm
    sudo $PACKAGEMANAGER install -y python3-pip
    sudo $PACKAGEMANAGER install -y neovim
    sudo $PACKAGEMANAGER install -y tmux
}

install_terminal_config() {
    curl -sS https://starship.rs/install.sh | sh
    wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/v$NERD_FONT_VERSION/$NERD_FONT.zip" -O $NERD_FONT.zip
    mkdir -p ~/.local/share/fonts
    unzip -qq $NERD_FONT.zip -d ~/.local/share/fonts
    rm $NERD_FONT.zip
    fc-cache -f -v
    curl -L https://github.com/Exafunction/codeium/releases/download/termium-v$TERMIUM_VERSION/install.sh | bash
}

install_go() {
    wget -q "https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz" -O go.tar.gz
    sudo tar -C /usr/local -xzf go.tar.gz
    rm go.tar.gz
}

append_to_bashrc() {
    echo "eval \"$(starship init bash)\"" >> ~/.bashrc
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
    source ~/.bashrc
}

create_symlinks() {
    ln -s ~/.dotfiles/nvim ~/.config/nvim
    ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
    ln -s ~/.dotfiles/term-theme/starship.toml ~/.config/starship.toml
}

main() {
    distro=$(detect_linux_distribution)
    set_package_manager "$distro"
    install_packages
    install_terminal_config
    install_go
    create_symlinks
    append_to_bashrc
}
