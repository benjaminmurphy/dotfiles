set -g prefix C-a
unbind C-b

set-option -g default-command zsh

set -g default-terminal "screen-256color"
set -g terminal-overrides 'xterm*:smcup@:rmcup@'

set -g base-index 1

bind r source-file ~/.tmux.conf

bind s split-window -v -c "#{pane_current_path}"
bind v split-window -h -c "#{pane_current_path}"
bind c new-window

bind z resize-pane -Z

setw -g mode-keys vi

set-option -g pane-border-fg colour235
set-option -g pane-active-border-fg "#999999"

set-option -g bell-action none
set-option -g visual-activity off
set-option -g visual-bell off
set-option -g visual-silence off
set-window-option -g monitor-activity off

set-option -g mouse on

run-shell "powerline-daemon -q"
source /Users/benjaminmurphy/Library/Python/2.7/lib/python/site-packages/powerline/bindings/tmux/powerline.conf

set -g history-limit 30000
