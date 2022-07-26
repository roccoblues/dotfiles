# dofiles

My personal dotfiles.

## Setup


### Install pending software updates and developer tools
```
sudo softwareupdate -ia --verbose
xcode-select --install
```

### Install Homebrew
```
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh
```

### Clone repo
```
git clone https://github.com/roccoblues/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### Install apps
```
brew bundle
```

### Set sane MacOS defaults
```
./set-macos-defaults.sh
```

### Symlink dotfiles to the right places
```
./install.sh
```

### Install asdf plugins
```
asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git
asdf plugin-add yarn
asdf plugin-add ruby
asdf plugin-add python
```
