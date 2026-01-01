#!/bin/bash
# Install base packages for JDE

source "$(dirname "$0")/../lib/utils.sh"
package_list="$(dirname "$0")/../packages/base.txt"

set -e

log "Installing base system packages..."


# Update package database
log "Updating package database..."

sudo pacman -Sy 

log "Installing base packages"

sudo pacman -S --needed --noconfirm \
    "$(grep -hvE '^\s*#' "$package_list")"