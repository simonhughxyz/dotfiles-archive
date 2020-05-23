#!/bin/sh

# GET
# Simon Hugh Moore
#
# Retrive data from pass file
# 
# Data must be organized in the file like so:
# meta_name: data
# for example:
# login: user_name

get(){
    # Get the data and trim surrounding whitespace.
    pass show "$2" | grep -i "$1:" | sed 's/^[^:]*:[[:space:]]*//;s/[[:space:]]*$//'
}

case "$2" in
    -c) get "$1" "$3" | xclip -selection clipboard;;
    *) get "$@";;
esac

