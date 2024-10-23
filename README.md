## Ubuntu

### Symbolic links creation

1. Change the directory to `/ubuntu/`.
2. Make the script executable:
    ```bash
    chmod +x ~/dotfiles/ubuntu/create_symlinks.sh

    ```
3. Run the script as admin:
    ```bash
    sudo ~/dotfiles/ubuntu/create_symlinks.sh
    ```

# [!> [!TIP]
>* The script automatically detects if a symbolic link already exists or if there’s a conflicting file/directory.
>* Modify the paths if needed, depending on how your dotfiles structure is organized.]
