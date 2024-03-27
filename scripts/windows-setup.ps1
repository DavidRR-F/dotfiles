$wingetInstalled = Get-Command winget -ErrorAction SilentlyContinue

$nerdFontUrl = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Agave.zip"
$goInstallerUrl = "https://golang.org/dl/go1.21.1.windows-amd64.msi"

$profileContent = @"
$env:STARSHIP_CONFIG = "$HOME\.dotfiles\term-theme\starship.toml"
Invoke-Expression (&starship init powershell)
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
"@

function Check-Directory {
  param([string]$dir)
  if (-not (Test-Path $dir)) {
    New-Item -ItemType Directory -Path $dir
  }
}


if (-not $wingetInstalled) {
    Write-Host "Error: 'winget' is not installed. Please install it to proceed."
    Exit
}

# Install Prompt Theming
Check-Directory -dir "$env:USERPROFILE\.nerd-fonts"
Invoke-WebRequest -Uri $nerdFontsUrl -OutFile "$nerdFontsDir\nerd-fonts.zip"
Expand-Archive -Path "$nerdFontsDir\nerd-fonts.zip" -DestinationPath $nerdFontsDir -Force
Remove-Item -Path "$nerdFontsDir\nerd-fonts.zip" -Force
winget install --id Starship.Starship
Write-Host "Starship has been installed."

# Install Set-PSReadline
Install-Module -Name PowerShellGet -Force
Install-Module -Name PSReadLine

# Install Python
winget install --id Python.Python.3.11 -e  

# Install Nodejs
winget install -e --id OpenJS.NodeJS

# Install Golang
Invoke-WebRequest -Uri $goInstallerUrl -OutFile "$env:USERPROFILE\go.msi"
Start-Process -FilePath "$env:USERPROFILE\go.msi" -ArgumentList "/quiet" -Wait
Remove-Item -Path "$env:USERPROFILE\go.msi" -Force
$env:Path += ";$env:ProgramFiles\Go\bin"

# Install Neovim
winget install --id=Neovim.Neovim  -e
cmd /c mklink /D "$env:LOCALAPPDATA\nvim" "$env:USERPROFILE\.dotfiles\nvim"

# Update Profile
Add-Content -Path $PROFILE -Value $profileContent
