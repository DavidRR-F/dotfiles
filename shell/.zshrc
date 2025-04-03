alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Environment Variables
export PATH="$PATH:/bin/zsh:$HOME/.local/bin:/usr/local/go/bin"
export EDITOR="nvim"

# Enable Emacs keybindings
bindkey -e

# Cursor movement
bindkey '^A' beginning-of-line        # Ctrl+A -> Move to beginning of line
bindkey '^E' end-of-line              # Ctrl+E -> Move to end of line
bindkey '^B' backward-char            # Ctrl+B -> Move backward one character
bindkey '^F' forward-char             # Ctrl+F -> Move forward one character
bindkey '^[b' backward-word           # Alt+B -> Move backward one word
bindkey '^[f' forward-word            # Alt+F -> Move forward one word

# Editing (Cut, Copy, Paste)
bindkey '^K' kill-line                # Ctrl+K -> Kill (cut) to end of line
bindkey '^U' backward-kill-line       # Ctrl+U -> Kill (cut) to beginning of line
bindkey '^W' backward-kill-word       # Ctrl+W -> Kill (cut) previous word
bindkey '^[d' kill-word               # Alt+D -> Kill (cut) next word
bindkey '^D' delete-char              # Ctrl+D -> Delete character under cursor
bindkey '^Y' yank                     # Ctrl+Y -> Paste last killed text

# Command History Navigation
bindkey '^P' up-line-or-history       # Ctrl+P -> Previous command in history
bindkey '^N' down-line-or-history     # Ctrl+N -> Next command in history
bindkey '^R' history-incremental-search-backward  # Ctrl+R -> Search history backward
bindkey '^S' history-incremental-search-forward   # Ctrl+S -> Search history forward (sometimes blocked by terminal)

# Transposing & Capitalizing
bindkey '^T' transpose-chars          # Ctrl+T -> Swap last two characters
bindkey '^[l' down-case-word          # Alt+L -> Lowercase word
bindkey '^[u' up-case-word            # Alt+U -> Uppercase word
bindkey '^[c' capitalize-word         # Alt+C -> Capitalize word

# Miscellaneous
bindkey '^L' clear-screen             # Ctrl+L -> Clear terminal screen
bindkey '^[y' yank-pop                # Alt+Y -> Cycle through clipboard history
bindkey '^[.' insert-last-word        # Alt+. -> Insert last argument from the previous command

{{ extras }}

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

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

if [ -z "$TMUX" ]; then
  if ! tmux has-session -t main 2>/dev/null; then
    tmux new-session -d -s main
  fi
  tmux attach -t main
fi
