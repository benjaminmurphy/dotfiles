autoload -U compinit
compinit

zmodload -i zsh/complist

export HISTSIZE=130000
export SAVEHIST=130000
export HISTFILE=~/.zsh_history

export GOPATH="/Users/benjaminmurphy/Development/go"
export GOBIN="/Users/benjaminmurphy/Development/go/bin"
export CONDAPATH="/Users/benjaminmurphy/Development/miniconda3/bin"
export PYENV_ROOT="$HOME/.pyenv"
export DEPOT_TOOLS_ROOT="$HOME/Development/depot_tools"
export KEYTIMEOUT=1
export FZF_DEFAULT_OPTS="--no-hscroll --no-mouse --cycle --history=/Users/benjaminmurphy/.fzfhist --tabstop=4"
export TERM="screen-256color-bce"
export EVENT_NOKQUEUE=1
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export EDITOR="vim"
export VISUAL=$EDITOR

setopt COMPLETE_IN_WORD
setopt AUTOCD
setopt BASHAUTOLIST
setopt RMSTARSILENT
setopt VI
setopt APPENDHISTORY
setopt SHAREHISTORY
setopt INCAPPENDHISTORY
setopt HISTFINDNODUPS
setopt HISTIGNOREALLDUPS
setopt HISTSAVENODUPS

alias tm='tmux attach -d -t $(basename $(pwd)) || tmux new -s $(basename $(pwd))'
alias ll='exa -lFa@ --git'

export PATH="$CONDAPATH:$DEPOT_TOOLS_ROOT:/Users/benjaminmurphy/Library/Python/2.7/bin:$GOPATH/bin:/usr/local/mysql/bin/:/opt/local/bin:$PYENV_ROOT/bin:$PATH"


powerline-daemon -q
. /Users/benjaminmurphy/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

stty stop undef
bindkey "^S" history-incremental-search-forward
bindkey "^R" history-incremental-search-backward
bindkey "^F" beginning-of-line
bindkey "^E" end-of-line

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

skim() {
    command open -a Skim $1
}

zstyle ':completion:*:*:git:*' script /usr/local/etc/bash_completion.d/git-completion.bash
fpath=(/usr/local/share/zsh-completions $fpath)
zstyle ':completion:*' menu select

# source ~/Development/emsdk/emsdk_env.sh
