#!/bin/sh

# EXPORT
# Simon Hugh Moore
#
# Export password store as encrypted or plain tar package.
# If encrypted, it uses the same gpg key as password-store.

password_store=~/.password-store          # location of password-store
gpg_id="$(cat "$password_store/.gpg-id")" # get gpg-id from password-store
now="$(date '+%Y-%m-%d_%H-%M-%S')"        # current date and time.

_plain() {
    tar -zcf - -C "$password_store" ./ 
}

_encrypt() {
    _plain | gpg2 -e -r "$gpg_id"
}


case "$1" in
    -p|--plain) shift; _plain > "pass.$now.tar.gz" ;;
    -e|--encrypt) shift; _encrypt > "pass.$now.tar.gz.gpg" ;;
    *) _encrypt > "pass.$now.tar.gz.gpg" ;;
esac
