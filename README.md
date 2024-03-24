# Dotfiles Repository

This repository contains my personal dotfiles.

### Installation

1. **Clone the Repository**:

```bash
   git clone https://github.com/DavidRR-F/dotfiles.git ~/.dotfiles
```

2. **Configure Dotfiles**:

- Linux (Ubuntu/Debian - RHEL/CentOS/Fedora):

```bash
$ chmod +x ./scripts/linux-setup.sh
$ ./scripts/linux-setup.sh
```

- Windows (in Command Prompt as Administrator):

  Install the necessary dependencies:
    - Neovim
    - Python
    - Nodejs
    - Golang
    - Starship/OhMyPosh
    - NerdFonts

  Add symlinks to your config files or move them somewhere else:

```cmd
mklink /D %LOCALAPPDATA%\nvim C:\Users\yourusername\.dotfiles\nvim
```

