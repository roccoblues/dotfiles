export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export PATH=$PATH:~/go/bin
export K9SCONFIG=~/.k9s
export AWS_DEFAULT_REGION=eu-central-1
export EDITOR=nvim

alias vim=nvim

# zsh history
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTTIMEFORMAT="[%F %T] "
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

# git aliases
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gdiff="git diff"
alias gl="git log"
alias gp="git push"
alias gpu="git pull"
alias gs="git status"
alias gt="git tag"
alias gm="git merge"

# delete local branches who's remote ref is gone
function gclean() {
  git fetch --prune
  for branch in $(git for-each-ref --format='%(if:equals=[gone])%(upstream:track)%(then)%(refname:short)%(end)' refs/heads); do
    git branch -D $branch;
  done
}

# Enable zsh completions
autoload -Uz compinit
compinit

# Initialize homebrew
# (/usr/local for macOS Intel, /opt/homebrew for Apple Silicon and /home/linuxbrew/.linuxbrew for Linux
[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
[ -f "/usr/local/bin/brew" ] && eval "$(/usr/local/bin/brew shellenv)"
[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Brew Autocompletion
if type brew &>/dev/null; then
 fpath+=$(brew --prefix)/share/zsh/site-functions
fi

# Zsh autocompletions
if type brew &>/dev/null; then
  fpath+=$(brew --prefix)/share/zsh-completions
fi

# Zsh autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Setup direnv
eval "$(direnv hook zsh)"

# Initialize asdf
. $(brew --prefix asdf)/asdf.sh

# Source local config
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

eval "$(starship init zsh)"
