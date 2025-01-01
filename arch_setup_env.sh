#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Packages to install from AUR
AUR_PACKAGES=(neovim emacs xclip go ttf-jetbrains-mono-nerd feh dmenu zoxide zsh ripgrep fd spotify discord kitty)

# Function to install packages using pacman
install_aur_packages() {
    echo "Installing packages..."
    for package in "${AUR_PACKAGES[@]}"; do
        if ! pacman -Q "$package" &>/dev/null; then
            echo "Installing $package..."
            sudo pacman -S --noconfirm "$package"
        else
            echo "$package is already installed. Skipping."
        fi
    done
}

# Copy configuration files
copy_config_files() {
    echo "Copying configuration files..."

    # Check if the required files exist
    if [[ -d "nvim" ]]; then
        mkdir -p ~/.config/nvim
        cp -r nvim/* ~/.config/nvim/
        echo "Copied nvim configuration to ~/.config/nvim/"
    else
        echo "nvim directory not found. Skipping."
    fi

    if [[ -d ".xmonad" ]]; then
        cp -r .xmonad ~/
        echo "Copied .xmonad to ~/"
    else
        echo ".xmonad directory not found. Skipping."
    fi

    if [[ -d ".xmobar" ]]; then
        cp -r .xmobar ~/
        echo "Copied .xmobar to ~/"
    else
        echo ".xmobar directory not found. Skipping."
    fi

    if [[ -f ".zshrc" ]]; then
        cp .zshrc ~/ 
        echo "Copied .zshrc to ~/"
    else
        echo ".zshrc file not found. Skipping."
    fi

    if [[ -f "kitty.conf" ]]; then
        cp kitty.conf ~/.config/kitty/ 
        echo "Copied kitty.conf to ~/"
    else
        echo ".kitty.conf file not found. Skipping."
    fi
}

# Set the default shell to zsh
set_shell_to_zsh() {
    echo "Setting default shell to zsh..."
    if [[ "$SHELL" != "$(which zsh)" ]]; then
        chsh -s $(which zsh)
        echo "Default shell changed to zsh."
    else
        echo "zsh is already the default shell."
    fi
}

# Run the functions
install_aur_packages
copy_config_files
set_shell_to_zsh

echo "Setup complete."
