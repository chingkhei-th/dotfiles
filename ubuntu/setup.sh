#!/bin/bash

# Get the directory of this script (repo root)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to safely create symlinks
link_file() {
    local source="$1"
    local target="$2"

    if [[ -L "$target" ]]; then
        echo "Symlink already exists: $target"
        return
    elif [[ -e "$target" ]]; then
        echo "Backing up existing file: $target -> $target.bak"
        mv "$target" "$target.bak"
    fi

    echo "Creating symlink: $target -> $source"
    ln -s "$source" "$target"
}

# Create symlinks for each configuration file

# .gitconfig
link_file "$HOME/dotfiles/ubuntu/.gitconfig" "$HOME/.gitconfig"

# Neovim configuration
link_file "$HOME/dotfiles/ubuntu/neovim/NvChad/nvim" "$HOME/.config/nvim"

# Starship configuration
link_file "$HOME/dotfiles/ubuntu/starship/starship.toml" "$HOME/.config/starship.toml"

# Bash configuration
link_file "$HOME/dotfiles/ubuntu/bash/.bashrc" "$HOME/.bashrc"

# Link .bashrc
link_file "$DOTFILES_DIR/ubuntu/bash/.bashrc" "$HOME/.bashrc"

# Link .secret-keys.gpg
link_file "$DOTFILES_DIR/.secret-keys.gpg" "$HOME/.secret-keys.gpg"

# Ensure .gnupg directory exists with secure permissions
mkdir -p "$HOME/.gnupg"
chmod 700 "$HOME/.gnupg"

# Link gpg-agent.conf
link_file "$DOTFILES_DIR/.gnupg/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"

echo "All symbolic links created!"
