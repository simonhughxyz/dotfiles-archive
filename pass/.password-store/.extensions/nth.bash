#!/bin/sh

# NTH
# Simon Hugh Moore
#
# Get the nth character from passwords.
# Some Idiotic websites require you too enter the nth char of a password.
# This extension for pass helps with that.

# get last argument (pass file name).
for pass_file in "$@";do :;done

# get the password
_pass="$( pass show "$pass_file" | head -n1 )"

# print the desired character.
for arg in "$@"; do
    [ "$arg" != "$pass_file" ] && echo "$_pass" | cut -c "$arg"
done
