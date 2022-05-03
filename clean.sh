#!/usr/bin/env bash
set -e -u -o pipefail

packages=$(find . -type d -maxdepth 0)
stow --verbose --delete "$packages"
rm -f ~/Library/Application\ Support/Code/User/settings.json
