#!/bin/bash
# JDE Setup - Main installation script for Jo's Desktop Environment
# This script sets up a minimal Arch Linux desktop environment with spectrwm and polybar

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "================================================"
echo "JDE - Jo's Desktop Environment Setup"
echo "================================================"
echo ""


for script in setup/*.sh; do
  echo "==> Running $script"
  bash "$script"
done


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
