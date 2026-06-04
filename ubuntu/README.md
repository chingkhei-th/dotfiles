# WSL2 Ubuntu Symlink Setup

This script creates symlinks for your dotfiles in WSL2 Ubuntu.

## Prerequisites

- WSL2 with Ubuntu installed
- Dotfiles cloned in Windows at `C:\Users\<your_username>\dotfiles`
- Dotfiles cloned in WSL at `~/dotfiles` (optional but recommended)

## What Gets Linked

| Source | Destination |
|--------|-------------|
| `common/starship/` | `~/.config/starship` |
| `common/yazi/config/` | `~/.config/yazi` |
| `ubuntu/bash/.bashrc` | `~/.bashrc` |
| `ubuntu/starship/` | `~/.config/starship` |
| `/mnt/d/Tools/neovim-configs/NvChad/nvim` | `~/.config/nvim` |

## Setup Steps

### 1. Copy script to WSL home (recommended)

If your dotfiles are on Windows filesystem (`/mnt/c/...`), copy the script into WSL to avoid permission issues:

```bash
cp /mnt/c/Users/<your_username>/dotfiles/ubuntu/create_symlink.sh ~/setup_symlinks.sh
```

### 2. Install dos2unix (optional but recommended)

```bash
sudo apt update
sudo apt install dos2unix
```

### 3. Fix line endings (Windows CRLF issue)

Choose one method:

**Using dos2unix (recommended):**
```bash
dos2unix ~/setup_symlinks.sh
```

**Using sed:**
```bash
sed -i 's/\r$//' ~/setup_symlinks.sh
```

> This fixes the `bad interpreter: /bin/bash^M` error caused by Windows line endings.

### 3. Make it executable

```bash
chmod +x ~/setup_symlinks.sh
```

### 4. Run the script

```bash
~/setup_symlinks.sh
```

### 5. Verify symlinks

```bash
# Check individual symlinks
ls -la ~/.bashrc
ls -la ~/.config/starship
ls -la ~/.config/yazi
ls -la ~/.config/nvim

# All should point to your dotfiles directory
```

## Troubleshooting

### "dotfiles directory not found"

The script auto-detects your Windows username, but if it fails:

```bash
# Set the path manually
export DOTFILES_DIR="/mnt/c/Users/<your_windows_username>/dotfiles"
~/setup_symlinks.sh
```

### "Permission denied"

```bash
# If WSL symlinks don't work, enable them
echo "[automount]" >> /etc/wsl.conf
echo "options=\"metadata,umask=22,fmask=11\"" >> /etc/wsl.conf
# Then restart WSL: wsl.exe --shutdown
```

## Manual Uninstall

To remove a symlink (not the original files):

```bash
rm ~/.bashrc
rm ~/.config/starship
rm ~/.config/yazi
rm ~/.config/nvim
```
