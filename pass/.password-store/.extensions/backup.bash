#!/bin/sh

# BACKUP
# Simon Hugh Moore
#
# Backup password store.
# Required export.bash.

password_store="/home/simon/.password-store" # location of password-store.
bk_dir="$password_store/.backup"             # location of root backup dir.
nr_backups=10                                # number of backups to keep.

_backup(){
    # make backup directory if it doesn't exit.
    mkdir -m 0700 -p $bk_dir
    # change to backup directory.
    cd $bk_dir
    # export pssword store to backup directory.
    pass export -p
}

_prune(){
    # Remove all backups apart from newest N backups.
    rm -f $( ls $bk_dir/pass.* | sort | head -n -${1:-$nr_backups} )
}

case $1 in
    -b) _backup ;;
    -p|prune) _prune $2 ;; 
    *) _backup ;;
esac
