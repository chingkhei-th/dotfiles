# Starship config
Invoke-Expression (&starship init powershell)

# Terminal icons
# Need to install Terminal-Icons first
Import-Module Terminal-Icons

# Terminal ReadLine
Import-Module PSReadLine

# Keymap to open nvim (NeoVIm)
Set-Alias -Name vi -Value "C:\Program Files\Neovim\bin\nvim.exe"

# Keymap to change dir to Lamzing
function lzd {
    Set-Location 'D:\Coding\Lamzing'
}

# Keymap to change dir to Lamzing OCR
function ocr {
    Set-Location 'D:\Coding\Lamzing\OCR'
}

# Keymap to change dir to Python (Udemy)
function pyd {
    Set-Location 'D:\Coding\Python\Udemy\Codes'
}

# Keymap to change dir to Python (Udemy Intermediate)
function pydi {
    Set-Location 'D:\Coding\Python\Udemy\Codes\02_Intermediate'
}

# UV Astral
# (& uv generate-shell-completion powershell) | Out-String | Invoke-Expression
# (& uvx --generate-shell-completion powershell) | Out-String | Invoke-Expression
