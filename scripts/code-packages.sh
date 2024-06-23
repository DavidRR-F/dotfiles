#!/bin/bash

PYTHON_VERSION=3.10

NPM_PACKAGE_FILE=./packages/npm-packages.txt
GO_PACKAGE_FILE=./packages/go-packages.txt
NODE_PACKAGE_FILE=./packages/node-packages.txt

go_install() {
  while read -r package; do 
    go install "$package"
  done < "$GO_PACKAGE_FILE"
}

npm_install() {
  nvm install latest
  packages_to_install=()
  while IFS= read -r package; do
    if [[ -n "$package" ]]; then
      if ! npm list -g --depth=0 | grep -qw "$package"; then
        packages_to_install+=("$package")
      else
        echo "NPM package '$package' is already installed."
      fi
    fi
  done < "$NPM_PACKAGE_FILE"

  # Install all packages in one command
  if [ ${#packages_to_install[@]} -ne 0 ]; then
    echo "Installing NPM packages: ${packages_to_install[*]}"
    npm install -g "${packages_to_install[@]}"
  else
    echo "All packages are already installed."
  fi
}

pyenv_install() {
  pyenv install $PYTHON_VERSION
  pyenv virtualenv $PYTHON_VERSION neovim3
  pyenv shell 
  packages_to_install=()
  while IFS= read -r package; do
    if [[ -n "$package" ]]; then
      if ! npm list -g --depth=0 | grep -qw "$package"; then
        packages_to_install+=("$package")
      else
        echo "Python package '$package' is already installed."
      fi
    fi
  done < "$PYTHON_PACKAGE_FILE"

  # Install all packages in one command
  if [ ${#packages_to_install[@]} -ne 0 ]; then
    echo "Installing Python packages: ${packages_to_install[*]}"
    pip install "${packages_to_install[@]}"
  else
    echo "All packages are already installed."
  fi
  pyenv deactivate
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

setup() {
  echo "Installing code packages"
  if command_exists go; then
    go_install
  else 
    echo "Go is not installed. Skipping..."
  fi
  if command_exists npm; then
    npm_install
  else
    echo "Npm is not installed. Skipping..."
  fi
  if command_exists pyenv; then
    pyenv_install
  else
    echo "pyenv is not installed. Skipping..."
  fi
}

setup
