# ZSH plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# ZSH plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab

autoload -U compinit && compinit

# Emacs Keybindings
bindkey -e
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

#History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_find_no_dups

# Completion Styling
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no 
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath' 

# wezterm
__wezterm_set_user_var() {
  if hash base64 2>/dev/null ; then
    if [[ -z "${TMUX}" ]] ; then
      printf "\033]1337;SetUserVar=%s=%s\007" "$1" `echo -n "$2" | base64`
    else
      printf "\033Ptmux;\033\033]1337;SetUserVar=%s=%s\007\033\\" "$1" `echo -n "$2" | base64`
    fi
  fi
}

# Set the current shell as a user var
__wezterm_set_user_var "WEZTERM_SHELL" "$SHELL"

# Set whether tmux is active as a user var
if [[ -z "${TMUX}" ]]; then
  __wezterm_set_user_var "WEZTERM_IN_TMUX" "0"
else
  __wezterm_set_user_var "WEZTERM_IN_TMUX" "1"
fi

if [ -f ~/.env ]; then
  source ~/.env
fi

if [ -f ~/.aliases.sh ]; then
  source ~/.aliases.sh
fi

# Aliases
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias box='VBoxManage'

# Posting TUI Config

export POSTING_THEME_DIRECTORY="$HOME/.config/posting/themes"
export POSTINGDIR="$HOME/post"

unalias post 2>/dev/null

post() {
    local collection="$POSTINGDIR/$1"
    local env="$POSTINGDIR/$1/shared.env"
    local collection_dir="$POSTINGDIR/$1"
    
    if [ ! -d "$collection_dir" ]; then
        mkdir -p "$collection_dir"
    fi 

    if [ ! -f "$env" ]; then
        touch "$env"
    fi

    command posting --collection "$collection" --env "$env"
}

export JUPYTER_CONFIG_DIR=$HOME/.local/share/jupyter
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.pyenv"
export POETRY_PLUGIN_DOTENV_LOCATION="$HOME/.env"
export POETRY_PLUGIN_DOTENV_IGNORE=0
export DOTNET_ROOT=$HOME/.dotnet
export PATH="/opt/mssql-tools/bin:$DOTNET_ROOT:$DOTNET_ROOT/tools:/usr/local/nvim-linux64/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/.local/bin:$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
#eval "$(fzf --zsh)"

# tmux session
if command -v tmux >/dev/null 2>&1; then
    if [ -z "$TMUX" ]; then
        # If there are existing tmux sessions, attach to the last one
        if tmux ls &>/dev/null; then
            tmux attach-session -t $(tmux ls | tail -n 1 | cut -d: -f1)
        else
            # Otherwise, start a new session
            tmux new-session -s primary
        fi
    fi
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
