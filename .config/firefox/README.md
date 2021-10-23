# Firefox config

These are my personal configs for firefox, they consist of:
- Custom firefox css with an emphasis on minimalism
- A default user.js with an emphasis on security, privacy and disabling bloat
- user.js extensions to re-enable some firefox features when needed

## Install Instructions
### Chrome
Create a symbolic link from the chrome directory to your firefox profile:
`ln -s ~/.config/chrome ~/.mozilla/firefox/PROFILE_DIR`

### User.js
I wrote a simple script, [userjsc](../../.local/bin/userjsc) to compile/concatenate the desired userjs and copy them
into your firefox profile, `userjsc -p PROFILE_DIR_NAME default.user.js OTHER.user.js`

Note: the latter user.js will always override the settings of the previous
user.js, so make sure they are in the desired order, with the last user.js
taking the most precedents.
