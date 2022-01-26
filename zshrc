export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Initialize homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Brew Autocompletion
if type brew &>/dev/null; then
 fpath+=$(brew --prefix)/share/zsh/site-functions
fi

# Zsh autocompletions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Setup direnv
eval "$(direnv hook zsh)"

# Initialize asdf
. $(brew --prefix asdf)/asdf.sh

eval "$(starship init zsh)"
