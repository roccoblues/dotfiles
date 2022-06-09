#!/usr/bin/env bash
set -e -u -o pipefail

for package in */; do
    stow --verbose --restow --dotfiles "$package"
done

if ! [[ -f ~/Library/Application\ Support/Code/User/settings.json ]]; then
    ln -s "$(PWD)/vscode-settings.json" ~/Library/Application\ Support/Code/User/settings.json
fi

if ! [[ -d ~/.tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git || true
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git || true
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git || true
asdf plugin-add yarn || true
asdf plugin-add ruby || true
asdf plugin-add python || true
