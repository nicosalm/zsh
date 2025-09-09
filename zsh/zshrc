setopt prompt_subst
autoload -U promptinit
promptinit

fpath=($HOME/.config/zsh/prompts $fpath)

source $HOME/.config/zsh/prompts/git.zsh
source $HOME/.config/zsh/prompts/grb.zsh

autoload -U compinit
compinit -D

export PATH=/usr/local/sbin:/usr/local/bin:${PATH}
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="gxfxcxdxbxegedabagacad"

export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

export EDITOR=nvim
export VISUAL=nvim
export TERM='xterm-256color'

set -o emacs

autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

export WORDCHARS='*?[]~&;!$%^<>'

function mkcd() { mkdir -p $1 && cd $1 }
function cdf() { cd *$1*/ }

function up() {
    local DIR=$PWD
    local TARGET=$1
    while [ ! -e $DIR/$TARGET -a $DIR != "/" ]; do
        DIR=$(dirname $DIR)
    done
    test $DIR != "/" && echo $DIR/$TARGET
}

unsetopt flowcontrol

export PATH="/opt/homebrew/bin:$PATH"

[[ -f /opt/homebrew/share/chruby/chruby.sh ]] && source /opt/homebrew/share/chruby/chruby.sh
[[ -f /usr/local/share/gem_home/gem_home.sh ]] && source /usr/local/share/gem_home/gem_home.sh

if [ -d "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    command -v pyenv >/dev/null && eval "$(pyenv init -)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias k="k -h"
alias l="eza -lAhrF --color=always"
alias ls="eza --group-directories-first --color=always"
alias e="exit"

export EZA_COLORS="di=36:ex=36:ln=35:so=35:pi=33:bd=33:cd=33:su=1;31:sg=1;31:tw=36:ow=36:*.tar=35:*.gz=35:*.zip=35:*.rar=35:*.7z=35:*.jpg=35:*.png=35:*.gif=35:*.mp3=35:*.mp4=35:*.pdf=32:*.txt=37:*.md=37:*.sh=36:*.py=36:*.rb=36:*.js=36:*.go=36:*.rs=36"

[ -f "/Users/nicosalm/.ghcup/env" ] && . "/Users/nicosalm/.ghcup/env"

export PNPM_HOME="/Users/nicosalm/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"

export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"

ZSH_CONFIGS_DIR="$HOME/.config/zsh/config"
if [ -d "$ZSH_CONFIGS_DIR" ] && [ "$(ls -A $ZSH_CONFIGS_DIR 2>/dev/null)" ]; then
    for file in "$ZSH_CONFIGS_DIR"/*; do
        source "$file"
    done
fi

source $HOME/.config/zsh/plugins.zsh
source $HOME/.config/zsh/plugins-optional.zsh

