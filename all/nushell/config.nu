alias ll = ls -lta

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

source ~/.config/nushell/catpuccin.nu
source ~/.zoxide.nu

