#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/.dotfiles"

cd "$DOTFILES_DIR"

stow -t "$HOME" --verbose */
