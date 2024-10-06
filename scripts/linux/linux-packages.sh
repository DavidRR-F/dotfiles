#!/bin/bash  

GO_VERSION=1.22.1
NODE_VERSION=20
NERD_FONT_VERSION=3.2.1
NERD_FONT=0xProto

PACKAGE_FILE=./packages/linux-packages.txt

wsl=false

get_package_manager() {
  distro=$(lsb_release -i -s | tr '[:upper:]' '[:lower:]')
  case "$distro" in
    ubuntu|debian)
      echo "apt" 
      ;;
    centos|rhel)
      echo "yum"
      ;;
    fedora)
      echo "dnf"
      ;;
    arch)
      echo "pacman -S"
      ;;
    *)
      echo "Unsupported distribution: $distro"
      exit 1
      ;;
  esac
}

install_packages() {
  echo "Installing linux packages"
  manager=$(get_package_manager)
  if [[ ! -f "$PACKAGE_LIST_FILE" ]]; then
    echo "Package list file '$PACKAGE_LIST_FILE' not found!"
    exit 1
  fi

  while IFS= read -r package; do 
    sudo $manager install -y "$package"
  done < "$PACKAGE_LIST_FILE"
}

flatpak_install() {
  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  sudo flatpak install -y org.mozilla.firefox
  sudo flatpak install -y com.discordapp.Discord
}

font_install() {
  # Install Nerd Font
  echo "Installing Nerd Font $NERD_FONT"
  wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/v$NERD_FONT_VERSION/$NERD_FONT.zip" -O $NERD_FONT.zip
  mkdir -p ~/.local/share/fonts
  unzip -qq $NERD_FONT.zip -d ~/.local/share/fonts
  rm $NERD_FONT.zip
  fc-cache -f -v 
}

go_install() {
  echo "Installing go $GO_VERSION"
  wget -q "https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz" -O go.tar.gz
  sudo tar -C /usr/local -xzf go.tar.gz
  rm go.tar.gz
}

pyenv_install() {
  echo "Installing pyenv"
  curl https://pyenv.run | bash
}

nvm_install() {
  echo "Installing nvm"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
}

starship_install() {
  echo "Installing starship"
  curl -sS https://starship.rs/install.sh | sh
}

zoxide_install() {
  echo "Installing zoxide"
  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
}

tpm_install() {
  echo "Installing tpm"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

setup() {
  install_packages
  font_install
  go_install
  nvm_install
  pyenv_install
  starship_install
  zoxide_install
  tpm_install
  if [ "$1" = true ]; then
    flatpak_install
  fi
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
fi

setup $wsl
