#!/bin/bash
# JDE Setup - Main installation script for Jo's Desktop Environment
# This script sets up a minimal Arch Linux desktop environment with spectrwm and polybar

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "================================================"
echo "JDE - Jo's Desktop Environment Setup"
echo "================================================"
echo ""

# Check if running as root
if [[ $EUID -eq 0 ]]; then
   echo "This script should not be run as root (use sudo when needed)"
   exit 1
fi

# Ensure we're on Arch Linux
if [[ ! -f /etc/arch-release ]]; then
    echo "Error: This script is designed for Arch Linux"
    exit 1
fi

echo "Step 1: Installing base system packages..."
bash "$SCRIPT_DIR/setup/01-install-packages.sh"

echo ""
echo "Step 2: Setting up dotfiles..."
bash "$SCRIPT_DIR/setup/02-setup-dotfiles.sh"

echo ""
echo "================================================"
echo "Setup complete!"
echo "================================================"
echo ""
echo "To start your desktop environment:"
echo "  1. Log out of your current session"
echo "  2. Add 'exec spectrwm' to your ~/.xinitrc"
echo "  3. Run 'startx' to start X.org with spectrwm"
echo ""
