#!/bin/sh

mkdir ~/.config

rm ~/.zshrc
rm ~/.vimrc
rm ~/.tmux.conf
rm -rf ~/.config/powerline
rm ~/.gitconfig

ln -s `pwd`/zsh ~/.zshrc
ln -s `pwd`/vim ~/.vimrc
ln -s `pwd`/tmux ~/.tmux.conf
ln -s `pwd`/powerline ~/.config/powerline
ln -s `pwd`/git ~/.gitconfig

# TODO: Eventually, handle installing powerline.
