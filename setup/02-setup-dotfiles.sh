#!/bin/bash
# Setup dotfiles using GNU stow

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$SCRIPT_DIR/../dotfiles"

echo "Setting up dotfiles with GNU stow..."
echo ""

# Check if dotfiles directory exists
if [[ ! -d "$DOTFILES_DIR" ]]; then
    echo "Error: Dotfiles directory not found at $DOTFILES_DIR"
    exit 1
fi

cd "$DOTFILES_DIR"

# Find all directories in dotfiles (each represents a stow package)
PACKAGES=($(find . -maxdepth 1 -type d -not -name "." -not -name ".." -printf "%f\n"))

if [[ ${#PACKAGES[@]} -eq 0 ]]; then
    echo "No dotfiles packages found. Skipping stow setup."
    echo "You can add your dotfiles to the dotfiles/ directory and run this script again."
    exit 0
fi

echo "Found the following dotfiles packages:"
printf '  - %s\n' "${PACKAGES[@]}"
echo ""

read -p "Do you want to stow all packages? (y/N) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Dotfiles setup cancelled."
    exit 0
fi

# Stow each package
for package in "${PACKAGES[@]}"; do
    echo "Stowing $package..."
    stow -v -t "$HOME" "$package"
done

echo ""
echo "Dotfiles setup complete!"
