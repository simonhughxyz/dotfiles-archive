set from = "simon.h.moore94@gmail.com"
set realname = "Simon H Moore"

# paths
set folder = ~/.mail/simonhmoore94@gmail.com

set sendmail  = "/usr/bin/msmtp gmail.simonhmoore94"

set spoolfile=+INBOX

source muttrc
