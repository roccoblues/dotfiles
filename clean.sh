#!/bin/bash
set -e -u -o pipefail

stow --verbose --delete */
rm -f ~/Library/Application\ Support/Code/User/settings.json
