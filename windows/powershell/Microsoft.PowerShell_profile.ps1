# Starship config
Invoke-Expression (&starship init powershell)

# Terminal icons
# Need to install Terminal-Icons first
Import-Module Terminal-Icons

# Command history and suggestions
Import-Module PSReadline

Set-PSReadLineOption -PredictionViewStyle ListView

# Keymap to open nvim (NeoVIm)
Set-Alias -Name vi -Value "C:\Program Files\Neovim\bin\nvim.exe"

# Keymap to change dir to Lamzing
function lzd {
    Set-Location 'D:\Coding\Lamzing'
}

# Keymap to change dir to Python (Udemy)
function pyd {
    Set-Location 'D:\Coding\Python\Udemy\Codes'
}

# Keymap to change dir to Python (Udemy Intermediate)
function pydi {
    Set-Location 'D:\Coding\Python\Udemy\Codes\02_Intermediate'
}

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

