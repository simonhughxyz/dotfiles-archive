#!/bin/sh

# NTH
# Simon Hugh Moore
#
# Get the nth character from passwords.
# Some Idiotic websites require you too enter the nth char of a password.
# This extension for pass helps with that.

# get last argument (pass file name).
for pass_file in "$@";do :;done

if [ "$1" == "get" ]; then
    _value="$( pass get "$2" "$pass_file" )"
    shift 2
else
    # get the password
    _value="$( pass show "$pass_file" | head -n1 )"
fi


# print the desired character.
for arg in "$@"; do
    [ "$arg" != "$pass_file" ] && echo "$_value" | cut -c "$arg"
done
