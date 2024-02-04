# Dotfiles Repository

This repository contains my personal dotfiles.

### Installation

1. **Clone the Repository**:

```bash
   git clone https://github.com/DavidRR-F/dotfiles.git ~/.dotfiles
```

2. Symlink the configuration folders to your config directories:

- Linux/macOS:

```bash
$ ln -s ~/.dotfiles/nvim ~/.config/nvim
```

- Windows (in Command Prompt as Administrator):

```cmd
mklink /D %LOCALAPPDATA%\nvim C:\Users\yourusername\.dotfiles\nvim
```

#### Structure

```bash
dotfiles/
└── nvim/
    ├── init.lua         # Entry point for Neovim configuration
    ├── lua/
    │   ├── core/        # Core configurations
    │   └── plugins/     # Plugin configurations
    └── README.md        # Documentation
```
