alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Environment Variables
export PATH="$PATH:/bin/bash:$HOME/.local/bin:/usr/local/go/bin"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export EDITOR="nvim"

# Enable bash completion if it's installed
BASH_COMPLETION_FILE=/usr/share/bash-completion/bash_completion
if [ -f "$BASH_COMPLETION_FILE" ]; then
    . "$BASH_COMPLETION_FILE"
fi

{{ extras }}

# cli tool hooks
eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(direnv hook bash)"

# Automatically activate virtualenvs
function activate_venv() {
  [ -f 'bin/activate' ] && source bin/activate
  [ -f '.venv/bin/activate' ] && source .venv/bin/activate
  [ -f 'environment.yml' ] && conda activate $(cat environment.yml | grep name: | head -n 1 | cut -f 2 -d ':')
  [ -f 'environment.yaml' ] && conda activate $(cat environment.yaml | grep name: | head -n 1 | cut -f 2 -d ':')
  return 0
}

cd() {
    z "$@"
    activate_venv
}

activate_venv
