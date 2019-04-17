#!/bin/sh

# This script will create a symlink for every local dotfile 
# to the $HOME directory
# WARNING! All equivilant dot files in $HOME will be permanently removed


# create symlink for all local dot files.
for f in "$PWD"/.*; do
    if [ -f "$f" ]; then
        newpath="$HOME/$(basename $f)"

        echo "removing $newpath..."
        rm -rf $newpath

        echo "creating symlink from $f to $newpath..."
        ln -s $f $newpath;
        echo ""
    fi
done
