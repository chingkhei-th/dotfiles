#!/bin/bash
# Setup symlinks for dotfiles in WSL2 Ubuntu

set -e

# Detect dotfiles location
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"

# Fallback to Windows path if not found
if [ ! -d "$DOTFILES_DIR" ]; then

    WIN_USER=$(cmd.exe /c 'echo %USERNAME%' 2>/dev/null | tr -d '\r')

    DOTFILES_DIR="/mnt/c/Users/$WIN_USER/dotfiles"

fi


if [ ! -d "$DOTFILES_DIR" ]; then

    echo "Error: dotfiles directory not found at $DOTFILES_DIR"

    echo "Set DOTFILES_DIR env var manually if needed"

    exit 1

fi


echo "Using dotfiles: $DOTFILES_DIR"

# ── Configs from Windows drives ─────────────────────────────────
NVIM_SOURCE="/mnt/d/Tools/neovim-configs/NvChad/nvim"

# ── Function to create symlink ───────────────────────────────────
link_config() {
    local src="$1"
    local dest="$2"
    
    # Create parent dir if needed
    mkdir -p "$(dirname "$dest")"
    
    # Remove existing file/dir if it exists
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "Removing existing: $dest"
        rm -rf "$dest"
    fi
    
    echo "Creating symlink: $dest -> $src"
    ln -s "$src" "$dest"
}

# ── NvChad Neovim config ────────────────────────────────────────
if [ -d "$NVIM_SOURCE" ]; then
    link_config "$NVIM_SOURCE" "$HOME/.config/nvim"
else
    echo "Warning: NvChad config not found at $NVIM_SOURCE"
fi

# ── Common configs ──────────────────────────────────────────────
COMMON_DIR="$DOTFILES_DIR/common"

# starship
if [ -d "$COMMON_DIR/starship" ]; then
    link_config "$COMMON_DIR/starship/starship.toml" "$HOME/.config/starship.toml"
fi

# yazi
if [ -d "$COMMON_DIR/yazi/config" ]; then
    link_config "$COMMON_DIR/yazi/config" "$HOME/.config/yazi"
fi

# ── Ubuntu-specific configs ──────────────────────────────────────
UBUNTU_DIR="$DOTFILES_DIR/ubuntu"

# .bashrc
if [ -f "$UBUNTU_DIR/bash/.bashrc" ]; then
    link_config "$UBUNTU_DIR/bash/.bashrc" "$HOME/.bashrc"
fi

echo "Done! Symlinks created successfully."
