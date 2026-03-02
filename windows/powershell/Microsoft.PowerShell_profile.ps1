# ====== Imports ======

# Starship config
Invoke-Expression (&starship init powershell)

# Terminal icons
# Need to install Terminal-Icons first
Import-Module -Name Terminal-Icons

# Command history and suggestions
Import-Module PSReadline

Set-PSReadLineOption -PredictionViewStyle ListView

# Yazi File manager (for file type detection)
$Env:YAZI_FILE_ONE = 'C:\Program Files\Git\usr\bin\file.exe'

# UV link-mode warning surpress
$env:UV_LINK_MODE = "copy"

# ==========
# ===== Keymaps =====

# Keymap to open nvim (NeoVIm)
Set-Alias -Name vi -Value "C:\Program Files\Neovim\bin\nvim.exe"

# Keymap to change dir to Work directory
function wrk {
    Set-Location 'D:\Work\'
}

# Keymap to open lazygit
Set-Alias -Name lg -Value 'lazygit'

# Keymap to change dir to Learning
function lrn {
    Set-Location 'D:\Learning\'
}

# Keymap to run Python
Set-Alias -Name py -Value 'python'

# Keymap to open explorer
Set-Alias -Name e -Value 'start'

# ==========
# ===== Functions =====

# Mimic "touch" command from Linux
function touch {
    param([string]$Path)

    if (-not (Test-Path $Path)) {
        New-Item -ItemType File -Path $Path -Force | Out-Null
    } else {
        $null = (Get-Item $Path).LastWriteTime = Get-Date
    }
}

# Activate python venv with `activate <env_name>`
function activate { param($env) . "$env\Scripts\Activate" }

# Ability to change the current working directory when exiting Yazi
function y {
    $tmp = (New-TemporaryFile).FullName
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    }
    Remove-Item -Path $tmp
}

# ==========
