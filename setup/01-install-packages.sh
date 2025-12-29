#!/bin/bash
# Install base packages for JDE

set -e

echo "Installing base system packages..."
echo ""

# Update package database
echo "Updating package database..."
sudo pacman -Sy

# Install X.org and related packages
echo "Installing X.org..."
XORG_PACKAGES=(
    xorg-server
    xorg-xinit
    xorg-xrandr
    xorg-xsetroot
)

# Install spectrwm window manager
echo "Installing spectrwm..."
WM_PACKAGES=(
    spectrwm
)

# Install polybar status bar
echo "Installing polybar..."
BAR_PACKAGES=(
    polybar
)

# Install GNU stow for dotfiles management
echo "Installing GNU stow..."
STOW_PACKAGES=(
    stow
)

# Additional useful packages
echo "Installing additional utilities..."
UTIL_PACKAGES=(
    dmenu           # Application launcher
    alacritty       # Terminal emulator
    feh             # Image viewer and wallpaper setter
    picom           # Compositor for transparency and effects
)

# Combine all packages
ALL_PACKAGES=(
    "${XORG_PACKAGES[@]}"
    "${WM_PACKAGES[@]}"
    "${BAR_PACKAGES[@]}"
    "${STOW_PACKAGES[@]}"
    "${UTIL_PACKAGES[@]}"
)

echo "The following packages will be installed:"
printf '  - %s\n' "${ALL_PACKAGES[@]}"
echo ""

read -p "Do you want to proceed with installation? (y/N) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation cancelled."
    exit 1
fi

# Install all packages
sudo pacman -S --needed --noconfirm "${ALL_PACKAGES[@]}"

echo ""
echo "Package installation complete!"
