#!/usr/bin/env bash

# Ansi codes
log() {
  printf "\e[1;32m[+] %s\e[0m\n" "$1"
}

warn() {
  printf "\e[1;33m[!] %s\e[0m\n" "$1"
}

error() {
  printf "\e[1;31m[x] %s\e[0m\n" "$1"
  exit 1
}

is_installed() {
  pacman -Qi "$1" &>/dev/null
}
