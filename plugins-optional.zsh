if command -v thefuck >/dev/null 2>&1; then
    eval $(thefuck --alias)
    alias f="fuck"
fi

if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi

gco() {
    local branches branch
    branches=$(git branch --all | grep -v HEAD) &&
    branch=$(echo "$branches" | fzf +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

gcoc() {
    local commits commit
    commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
    commit=$(echo "$commits" | fzf --tac +s +m -e) &&
    git checkout $(echo "$commit" | sed "s/ .*//")
}

google() { open "https://www.google.com/search?q=$*" }
github() { open "https://github.com/search?q=$*" }
stackoverflow() { open "https://stackoverflow.com/search?q=$*" }

export MARKPATH=$HOME/.marks
function jump { cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1" }
function mark { mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1" }
function unmark { rm -i "$MARKPATH/$1" }
function marks { ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo }

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

calc() { echo "$*" | bc -l }

mcd() { mkdir -p "$1" && cd "$1" }

findtext() { grep -r "$1" . }

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log --oneline --graph --decorate'
alias gla='git log --oneline --graph --decorate --all'

alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dimg='docker images'
alias drm='docker rm $(docker ps -aq)'
alias drmi='docker rmi $(docker images -q)'

fp() {
    fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
}

fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    if [ "x$pid" != "x" ]; then
        echo $pid | xargs kill -${1:-9}
    fi
}
