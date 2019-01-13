#!/bin/bash

# source local .profile to get ENV variables
source .profile

# remove all old files
rm $HOME/.bashrc
rm $HOME/.profile
rm $HOME/.bash_profile
rm $HOME/.vimrc
rm $HOME/.Xresources
rm $HOME/.cookiecutterrc
rm $HOME/.tmux.conf

# create symlink for all dotfiles
ln -s $DOTFILES/.bashrc $HOME/.bashrc
ln -s $DOTFILES/.profile $HOME/.profile
ln -s $DOTFILES/.bash_profile $HOME/.bash_profile
ln -s $DOTFILES/.vimrc $HOME/.vimrc
ln -s $DOTFILES/.Xresources $HOME/.Xresources
ln -s $DOTFILES/.cookiecutterrc $HOME/.cookiecutterrc
ln -s $DOTFILES/.tmux.conf $HOME/.tmux.conf
