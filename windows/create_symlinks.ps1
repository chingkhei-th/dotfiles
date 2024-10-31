# This script will automatically create symbolic links for each file and folder in each desired path.
# Make sure you run this script as Administrator.

# Run this script as admin
powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -Verb RunAs powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File \"$UserProfile\dotfiles\windows\create_symlinks.ps1\"'"


# Check if running as admin
# if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
#     Write-Warning "Please run PowerShell as administrator."
#     exit
# }

# Define user profile path
$UserProfile = [System.Environment]::GetFolderPath("UserProfile")

# Function to create symbolic links
function Create-Symlink {
    param (
        [string]$Link,
        [string]$Target,
        [string]$Type = "File"
    )

    # Check if the link already exists
    if (-not (Test-Path -Path $Link)) {
        # Create symbolic link based on type
        if ($Type -eq "Directory") {
            cmd.exe /c mklink /D "$Link" "$Target"
        } elseif ($Type -eq "Hard") {
            cmd.exe /c mklink /H "$Link" "$Target"
        } else {
            cmd.exe /c mklink "$Link" "$Target"
        }
        Write-Host "Created symlink: $Link -> $Target"
    } else {
        Write-Host "Link already exists: $Link"
    }
}

# Starship configuration
Create-Symlink "$UserProfile\.config\starship.toml" "$UserProfile\dotfiles\windows\starship\starship.toml" "Hard"

# NeoVim configuration (directory link)
Create-Symlink "$UserProfile\AppData\Local\nvim" "$UserProfile\dotfiles\windows\neovim\NvChad\nvim" "Directory"

# PowerShell profile configuration
Create-Symlink "$UserProfile\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" "$UserProfile\dotfiles\windows\powershell\Microsoft.PowerShell_profile.ps1" "Hard"

# .gitconfig
Create-Symlink "$UserProfile\.gitconfig" "$UserProfile\dotfiles\windows\.gitconfig"

# VSCode extensions.json (hard link)
Create-Symlink "$UserProfile\.vscode\extensions\extensions.json" "$UserProfile\dotfiles\windows\vscode\extensions\extensions.json" "Hard"

# VSCode argv.json (hard link)
Create-Symlink "$UserProfile\.vscode\argv.json" "$UserProfile\dotfiles\windows\vscode\argv.json" "Hard"

Write-Host "All symbolic links created!"

# Keep the PowerShell window open to display the output
Pause