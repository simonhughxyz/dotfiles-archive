#!/bin/sh

# This install script will create a symlink for every file and directory
# in the local .config dir to the path associated with $CONFIG in the local
# .profile file. 
# WARNING! All equivilant files in $CONFIG will be permenantly removed

# create symlink for all files and dirs in .config
for f in "$PWD"/.config/*; do
    newpath="$XDG_CONFIG_HOME/$(basename $f)"

    echo "removing $newpath..."
    rm -rf $newpath

    echo "creating symlink from $f to $newpath..."
    ln -s $f $newpath;
    echo ""
done
