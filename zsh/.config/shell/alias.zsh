# ZSH alias

# Suffix
alias -s {mp4,MP4,mkv,MKV,mp3,MP3,mov,MOV,mpg,MPG,m4v,M4V,ogg,OGG,wav,WAV,webm,WEBM}='mpv'
alias -s {jpg,JPG,png,PNG,gif,GIF,tif,TIF,tiff,TIFF}='sxiv'
alias -s {pdf,PDF,ps,PS}='zathura'


# cd
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'

# Global
alias -g NO='1> /dev/null'
alias -g NE='2> /dev/null'
alias -g NA='&> /dev/null'
alias -g G='| rg -i'
alias -g C='| wc -l'
alias -g L='| less'
