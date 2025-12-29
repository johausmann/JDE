#!/usr/bin/env bash
source "$(dirname "$0")/../lib/utils.sh"

if ! command -v paru &>/dev/null; then
  log "Installing paru as AUR helper"
  git https://aur.archlinux.org/paru.git /tmp/paru
  (cd /tmp/paru && makepkg -si --noconfirm)
fi
