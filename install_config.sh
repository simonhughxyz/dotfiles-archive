#!/bin/bash

# source .profile for ENV variables
source .profile

# define dotfiles/.config and home/.config

homeconfig="$HOME/.config"
dotconfig="$PWD/.config"

# create symlink for all files in .config

for f in $dotconfig/*; do
    newpath="$homeconfig/$(basename $f)"
    echo "$f to $newpath"
    rm -rf $newpath
    ln -s $f $newpath;
done
