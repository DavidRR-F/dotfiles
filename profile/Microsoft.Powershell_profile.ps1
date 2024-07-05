$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
$ENV:XDG_CONFIG_HOME="$HOME\.config"
$DotFilesPath = "$HOME\.dotfiles"
Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })

# Emacs-like key bindings
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Chord Ctrl+a -Function BeginningOfLine
Set-PSReadlineKeyHandler -Chord Ctrl+e -Function EndOfLine
Set-PSReadlineKeyHandler -Chord Ctrl+b -Function BackwardChar
Set-PSReadlineKeyHandler -Chord Ctrl+f -Function ForwardChar
Set-PSReadlineKeyHandler -Chord Ctrl+k -Function KillLine
Set-PSReadlineKeyHandler -Chord Ctrl+u -Function BackwardDeleteLine
Set-PSReadlineKeyHandler -Chord Ctrl+y -Function Yank
Set-PSReadlineKeyHandler -Chord Ctrl+w -Function BackwardKillWord
Set-PSReadlineKeyHandler -Chord Alt+d -Function KillWord
Set-PSReadlineKeyHandler -Chord Ctrl+n -Function NextHistory
Set-PSReadlineKeyHandler -Chord Ctrl+p -Function PreviousHistory
