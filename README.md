# dofiles

My personal dotfiles.

## Setup

```
# clone repo
git clone https://github.com/roccoblues/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# set sane macOS defaults
./set-macos-defaults.sh

# install all brew dependencies
brew bundle

# symlink dotfiles to the right places
./install.sh
```
