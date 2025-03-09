alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Environment Variables
export PATH="$PATH:/bin/bash:$HOME/.local/bin:/usr/local/go/bin"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if [ ! -d "$HOME/homebrew" ]; then
  mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip-components 1 -C homebrew
  eval "$(homebrew/bin/brew shellenv)"
  brew update --force --quiet
  chmod -R go-w "$(brew --prefix)/share/zsh"
fi

# cli tool hooks
eval "$(homebrew/bin/brew shellenv)"
eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"
eval "$(direnv hook bash)"
