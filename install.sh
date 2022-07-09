#!/usr/bin/env bash
set -e -u -o pipefail

for package in */; do
    stow --verbose --restow --dotfiles "$package"
done

if ! [[ -f ~/Library/Application\ Support/Code/User/settings.json ]]; then
    ln -s "$(PWD)/vscode-settings.json" ~/Library/Application\ Support/Code/User/settings.json
fi
