#!/bin/sh

# EXPORT
# Simon Hugh Moore
#
# Export password store as encrypted or plain tar package.
# If encrypted, it uses the same gpg key as password-store.

prefix=~/
password_store=~/.password-store    # location of password-store
gpg_id="$(cat "$password_store/.gpg-id")"       # get gpg-id from password-store
now="$(date '+%Y-%m-%d_%H-%M-%S')"

_plain() {
    tar -zcf - -C "$password_store" ./ 
}

_encrypt() {
    plain | gpg -e -r "$gpg_id"
}


case "$1" in
    -p|--plain) shift; _plain > "$prefix/pass.$now.tar.gz" ;;
    -e|--encrypt) _encrypt > "$prefix/pass.$now.tar.gz.gpg" ;;
    *) _encrypt > "$prefix/pass.$now.tar.gz.gpg" ;;
esac
exit 0
