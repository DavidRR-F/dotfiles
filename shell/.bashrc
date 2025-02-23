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

# Enable bash completion if it's installed
BASH_COMPLETION_FILE=/usr/share/bash-completion/bash_completion
if [ -f "$BASH_COMPLETION_FILE" ]; then
    . "$BASH_COMPLETION_FILE"
fi

# cli tool hooks
eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"
eval "$(direnv hook bash)"
