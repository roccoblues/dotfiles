#!/usr/bin/env bash
set -e -u -o pipefail

packages=$(find . -type d -maxdepth 0)
stow --verbose --restow --dotfiles "$packages"

if ! [[ -f ~/Library/Application\ Support/Code/User/settings.json ]]; then
    ln -s "$(PWD)/vscode-settings.json" ~/Library/Application\ Support/Code/User/settings.json
fi

if ! [[ -d ~/.tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
