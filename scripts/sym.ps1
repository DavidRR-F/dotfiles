$dotPath = $HOME/.dotfiles
 
if (-Not (Test-Path -Path $basePath)) {
    Write-Error "The target path '$basePath' does not exist."
    exit
}

# dotfiles
$directories = Get-ChildItem -Path $basePath -Directory | Where-Object { $_.Name -like '.*' }

foreach ($dir in $directories) {
    $linkPath = Join-Path -Path $HOME -ChildPath $dir.Name
    
    if (-Not (Test-Path -Path $linkPath)) {
        New-Item -ItemType SymbolicLink -Path $linkPath -Target $dir.FullName
        Write-Output "Created symlink: $linkPath -> $dir.FullName"
    } else {
        Write-Output "Symlink already exists: $linkPath"
    }
}

# other 
# Read and convert JSON file to PowerShell object
$jsonPath = $dotPath/path.json
$configArray = Get-Content -Path $jsonPath | ConvertFrom-Json

foreach ($config in $configArray) {
    $basePath = $ExecutionContext.InvokeCommand.ExpandString($config.basePath)
    $linkPath = $ExecutionContext.InvokeCommand.ExpandString($config.linkPath)

    if (-Not (Test-Path -Path $basePath)) {
        Write-Error "The target path '$basePath' does not exist."
        continue
    }

    if (-Not (Test-Path -Path $linkPath)) {
        New-Item -ItemType SymbolicLink -Path $linkPath -Target $basePath
        Write-Output "Created symlink: $linkPath -> $basePath"
    } else {
        Write-Output "Symlink already exists: $linkPath"
    }
}
