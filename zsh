alias tm='tmux attach -d -t $(basename $(pwd)) || tmux new -s $(basename $(pwd))'
alias ll='ls -GFalAhp'

cd() {
    builtin cd "$@" 
    if [[ $? -eq 0 ]]; then
        ll
    fi
}

setopt AUTOCD
setopt BASHAUTOLIST
setopt RMSTARSILENT

export GOPATH="/Users/benjaminmurphy/Development/go"
export GOBIN="/Users/benjaminmurphy/Development/go/bin"
export CONDAPATH="/Users/benjaminmurphy/Development/miniconda3/bin"
export PYENV_ROOT="$HOME/.pyenv"
export DEPOT_TOOLS_ROOT="$HOME/Development/depot_tools"
export PATH="$CONDAPATH:$DEPOT_TOOLS_ROOT:/Users/benjaminmurphy/Library/Python/2.7/bin:$GOPATH/bin:/usr/local/mysql/bin/:/opt/local/bin:$PYENV_ROOT/bin:$PATH"

export TERM="screen-256color-bce"
export EVENT_NOKQUEUE=1
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export KEYTIMEOUT=1
export FZF_DEFAULT_OPTS="--no-hscroll --no-mouse --cycle --history=/Users/benjaminmurphy/.fzfhist --tabstop=4"

powerline-daemon -q
. /Users/benjaminmurphy/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

bindkey "^R" history-incremental-search-backward

escape () {
    print -r -- "$1 ${(q)2}"
}

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

skim() {
    command open -a Skim $1
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

zstyle ':completion:*:*:git:*' script /usr/local/etc/bash_completion.d/git-completion.bash
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit && compinit
zmodload -i zsh/complist
zstyle ':completion:*' menu select

# source ~/Development/emsdk/emsdk_env.sh
