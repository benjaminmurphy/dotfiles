autoload -U compinit
compinit

zmodload -i zsh/complist

export HISTSIZE=130000
export SAVEHIST=130000
export HISTFILE=~/.zsh_history

export GOPATH="/Users/benjaminmurphy/Development/go"
export GOBIN="/Users/benjaminmurphy/Development/go/bin"

export KEYTIMEOUT=1
export FZF_DEFAULT_OPTS="--no-hscroll --no-mouse --cycle --history=/Users/benjaminmurphy/.fzfhist --tabstop=4"
export TERM="screen-256color-bce"
export EVENT_NOKQUEUE=1
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
alias ls='exa -lFag --git'
alias ll='ls'

export PATH="/Users/benjaminmurphy/Library/Python/2.7/bin:$GOPATH/bin:/usr/local/mysql/bin/:/opt/local/bin:$PATH"

powerline-daemon -q
. /Users/benjaminmurphy/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

stty stop undef
bindkey "^S" history-incremental-search-forward
bindkey "^R" history-incremental-search-backward
bindkey "^F" beginning-of-line
bindkey "^E" end-of-line

skim() {
    command open -a Skim $1
}

vpn() {
    osascript -e 'tell application "Viscosity" to connect "browncs-gateall"'
    mosh --experimental-remote-ip=remote brown zsh
}

zstyle ':completion:*:*:git:*' script /usr/local/etc/bash_completion.d/git-completion.bash
fpath=(/usr/local/share/zsh-completions $fpath)
zstyle ':completion:*' menu select

export LDFLAGS="-L/usr/local/opt/qt/lib:$LDFLAGS"
export CPPFLAGS="-L/usr/local/opt/qt/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/qt/lib/pkgconfig"

export PATH=/Users/benjaminmurphy/.local/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/benjaminmurphy/Development/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/benjaminmurphy/Development/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/benjaminmurphy/Development/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/benjaminmurphy/Development/google-cloud-sdk/completion.zsh.inc'; fi
