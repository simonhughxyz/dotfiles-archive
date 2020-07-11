set from = "simon.h.moore94@gmail.com"
set realname = "Simon H Moore"

# paths
set folder = ~/.mail/simonhmoore94@gmail.com

set sendmail  = "/usr/bin/msmtp gmail.simonhmoore94"

set spoolfile=+INBOX

# Not much
virtual-mailboxes "INBOX" "notmuch://?query=to:simon.h.moore94@gmail.com AND tag:inbox"
virtual-mailboxes "NEW" "notmuch://?query=to:simon.h.moore94@gmail.com AND tag:new"

source ../config.muttrc
