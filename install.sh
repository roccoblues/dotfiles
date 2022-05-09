#!/usr/bin/env bash
set -e -u -o pipefail

for package in */; do
    if [[ "$package" == "iterm2" ]]; then
        continue
    fi
    stow --verbose --restow --dotfiles "$package"
done

if ! [[ -f ~/Library/Application\ Support/Code/User/settings.json ]]; then
    ln -s "$(PWD)/vscode-settings.json" ~/Library/Application\ Support/Code/User/settings.json
fi

if ! [[ -d ~/.tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
