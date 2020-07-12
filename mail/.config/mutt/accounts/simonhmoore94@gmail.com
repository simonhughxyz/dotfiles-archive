set from = "simon.h.moore94@gmail.com"
set realname = "Simon H Moore"

# paths
set folder = ~/.mail/simonhmoore94@gmail.com

set sendmail  = "/usr/bin/msmtp gmail.simonhmoore94"

set spoolfile=+INBOX

# Not much
virtual-mailboxes "INBOX" "notmuch://?query=to:simon.h.moore94@gmail.com AND tag:inbox"
virtual-mailboxes "Unread" "notmuch://?query=to:simon.h.moore94@gmail.com AND tag:unread"
virtual-mailboxes "Sent" "notmuch://?query=to:simon.h.moore94@gmail.com AND tag:sent"
virtual-mailboxes "Archive" "notmuch://?query=to:simon.h.moore94@gmail.com AND tag:archive"
virtual-mailboxes "Trash" "notmuch://?query=to:simon.h.moore94@gmail.com AND tag:deleted"
virtual-mailboxes "Spam" "notmuch://?query=to:simon.h.moore94@gmail.com AND tag:spam"

source ../config.muttrc
