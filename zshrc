export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$PATH:~/go/bin
export K9SCONFIG=~/.k9s

# zsh history
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTTIMEFORMAT="[%F %T] "
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

# Enable zsh completions
autoload -Uz compinit
compinit

# Initialize homebrew
eval "$($(brew --prefix)/bin/brew shellenv)"

# Brew Autocompletion
if type brew &>/dev/null; then
 fpath+=$(brew --prefix)/share/zsh/site-functions
fi

# Zsh autocompletions
if type brew &>/dev/null; then
  fpath+=$(brew --prefix)/share/zsh-completions
fi

# Zsh autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Setup direnv
eval "$(direnv hook zsh)"

# Initialize asdf
. $(brew --prefix asdf)/asdf.sh

# Source local config
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

eval "$(starship init zsh)"
