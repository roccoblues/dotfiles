export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.local/bin/
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export K9SCONFIG=~/.k9s
export AWS_DEFAULT_REGION=eu-central-1
export EDITOR=nvim
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export ASDF_CONFIG_FILE=${XDG_CONFIG_HOME}/asdf/asdfrc
export ASDF_DATA_DIR=${XDG_DATA_HOME}/asdf
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

alias vim=nvim
bindkey -e

setopt autocd            # automatically cd into typed directory
setopt pushd_ignore_dups # Don’t push multiple copies of the same directory onto the directory stack.
setopt pushd_minus       # Exchanges the meanings of ‘+’ and ‘-’ when used with a number to specify a directory in the stack.

## Turn off all beeps
unsetopt BEEP

# zsh history
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTTIMEFORMAT="[%F %T] "
setopt INC_APPEND_HISTORY        # add commands to HISTFILE in order of execution
setopt EXTENDED_HISTORY          # record timestamp of command in HISTFILE
setopt HIST_EXPIRE_DUPS_FIRST    # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_FIND_NO_DUPS         # don't show duplicates
setopt HIST_IGNORE_ALL_DUPS      # keep only the newest entry of duplicates
setopt HIST_IGNORE_SPACE         # ignore commands that start with space
setopt HIST_VERIFY               # show command with history expansion to user before running it

# space expands !!, !$ and !*
bindkey ' ' magic-space

# git aliases
alias g='git'
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

# fix some defaults
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"
alias bc="bc -ql"
alias mkd="mkdir -pv"

# other
alias ls="exa"
alias ll='exa -bghla -sname --group-directories-first'
alias tree='exa -sname --tree'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias yt="youtube-dl --add-metadata -i -o '%(upload_date)s-%(title)s.%(ext)s'"
alias yta="yt -x -f bestaudio/best"
alias d="docker"
alias dps="docker ps"
alias dcu="docker compose up --build"
alias dcd="docker compose down"
alias dcb="docker compose build"

# delete local branches who's remote ref is gone
function gclean() {
    git fetch --prune
    for branch in $(git for-each-ref --format='%(if:equals=[gone])%(upstream:track)%(then)%(refname:short)%(end)' refs/heads); do
        git branch -D $branch;
    done
}

function cdup() {
  cd "$(git rev-parse --show-toplevel)"
}

# show color palette
function colors() {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i ;
        if ! (( ($i + 1 ) % 8 )); then
            echo ;
        fi ;
    done
 }

# https://github.com/ryboe/q
function qq() {
    clear

    logpath="$TMPDIR/q"
    if [[ -z "$TMPDIR" ]]; then
        logpath="/tmp/q"
    fi

    if ! [[ -f "$logpath" ]]; then
        echo 'Q LOG' > "$logpath"
    fi

    tail -100f -- "$logpath"
}
function rmqq() {
    logpath="$TMPDIR/q"
    if [[ -z "$TMPDIR" ]]; then
        logpath="/tmp/q"
    fi
    if [[ -f "$logpath" ]]; then
        rm "$logpath"
    fi
    qq
}

# What process is using this port?
function portls() {
    local port=$1
    sudo lsof -nP -iTCP -sTCP:LISTEN | grep ":$port "
}

# Enable zsh completions
autoload -Uz compinit
compinit
_comp_options+=(globdots)

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
unset ASDF_DIR
source $(brew --prefix asdf)/libexec/asdf.sh

# Source local config
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Use fzf for autocompletion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# enable syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
