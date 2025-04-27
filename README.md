# How to use this dotfiles?

## Windows

### Setup guide

1. Clone the repository (in the home directory):
    ```powershell
    git clone https://github.com/chingkhei-th/dotfiles.git
    ```

### Install additional Modules
Install Terminal-icons:
```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery
```
---
## Ubuntu

### Setup guide

1. Clone the repository (in the home directory):
    ```shell
    git clone https://github.com/chingkhei-th/dotfiles.git
    ```
---
### Installing and Initializing Starship
1. Install Starship:
    ```bash
    curl -sS https://starship.rs/install.sh | sh
    ```
2. Set up your shell to use Starship:
    ```bash
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
    ```
    This will add `eval "$(starship init bash)"` this line in the `~/.bashrc` file.`
---

### Symbolic links creation

1. From `$Home` directory. To make sure run `cd $HOME`.
2. Make the script executable:
    ```bash
    chmod +x ~/dotfiles/ubuntu/setup.sh

    ```
3. Run the script as admin:
    ```bash
    sudo ~/dotfiles/ubuntu/setup.sh
    ```

or Manually create the symbolic links:

1. Make sure you are in home directory, if not run:
    ```bash
    cd $home
    ```
2. For creating symbolic link for Starship, run:
    ```bash
    ln -s "$HOME/dotfiles/ubuntu/starship/starship.toml" "$HOME/.config/starship.toml"
    ```
3. Do the same for others.



# [!> [!TIP]
>* The script automatically detects if a symbolic link already exists or if there’s a conflicting file/directory.
>* Modify the paths if needed, depending on how your dotfiles structure is organized.]
