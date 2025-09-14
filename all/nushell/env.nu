$env.PATH ++= ["~/.nix-profile/bin", "~/.local/bin"]
$env.EDITOR = "nvim"

$env.config = {
  hooks: {
    pre_prompt: [{ ||
      if (which direnv | is-empty) {
        return
      }

      direnv export json | from json | default {} | load-env
      if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
        $env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
      }
    }]
  }
}

$env.config.edit_mode = 'vi'

zoxide init nushell --cmd cd | save -f ~/.zoxide.nu
