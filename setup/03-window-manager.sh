!/bin/bash
# Install base packages for JDE

source "$(dirname "$0")/../lib/utils.sh"
package_list = "$(dirname "$0")/../packages/wm.txt

set -e

sudo pacman -Sy 

log "Installing spectrwm from AUR"

paru -S --needed --noconfirm spectrwm

log "Installing other desktop packages from Arch repos"

sudo pacman -S --needed --noconfirm \
    "$(grep -hvE '^\s*#' $package_list)"

sudo systemctl enable lemurs.service

