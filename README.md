# Dotfiles Repository

This repository contains my personal dotfiles.

### Installation

1. **Clone the Repository**:

```bash
   git clone https://github.com/DavidRR-F/dotfiles.git ~/.dotfiles
```

2. **Configure Dotfiles**:

This `linux-deb-install.sh` will install all package deps, applications, and create sym links (run in dotfile root directory)

- Linux (Ubuntu/Debian):

```bash
$ chmod +x ./scripts/linux-deb-install.sh
$ ./scripts/linux-deb-install.sh
```

- Windows Wsl (Ubuntu/Debain)

```bash
$ chmod +x ./scripts/linux-deb-install.sh
$ ./scripts/linux-deb-install.sh -w
```
