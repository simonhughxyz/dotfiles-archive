#!/bin/bash

# source .profile for ENV variables
source .profile

# create symlink for all files in .config

for f in $PWD/.config/*; do
    $newpath="$HOME/.config/$(basename $f)"
    rm -rf $newpath
    ln -s $f $newpath;
done
