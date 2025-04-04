#!/bin/bash

# Function to create symbolic links
create_symlink() {
    local target=$1
    local link=$2

    # Check if the link already exists
    if [ -L "$link" ]; then
        echo "Symlink already exists: $link"
    elif [ -e "$link" ]; then
        echo "A file or directory already exists at: $link"
    else
        ln -s "$target" "$link"
        echo "Created symlink: $link -> $target"
    fi
}

# Create symlinks for each configuration file

# .gitconfig
create_symlink "$HOME/dotfiles/ubuntu/.gitconfig" "$HOME/.gitconfig"

# Neovim configuration
create_symlink "$HOME/dotfiles/ubuntu/neovim/NvChad/nvim" "$HOME/.config/nvim"

# Starship configuration
create_symlink "$HOME/dotfiles/ubuntu/starship/starship.toml" "$HOME/.config/starship.toml"

# Bash configuration
create_symlink "$HOME/dotfiles/ubuntu/bash/.bashrc" "$HOME/.bashrc"

echo "All symbolic links created!"
