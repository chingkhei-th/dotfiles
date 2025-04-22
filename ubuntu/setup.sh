#!/bin/bash

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

# Link .bashrc
link_file "$HOME/dotfiles/ubuntu/bash/.bashrc" "$HOME/.bashrc"

echo "All symbolic links created!"
