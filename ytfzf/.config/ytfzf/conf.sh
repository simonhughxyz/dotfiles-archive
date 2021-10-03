#This is the default config file
#this file is read when it is placed in ~/.config/ytfzf

#keep in mind that this is a .sh file, and can be used as such

#this config file can be completely empty and ytfzf will still work (as these are the default settings),
    #so feel free to get rid of anything you don't want in here

#####################
#    Directories    #
#####################

#the directory to store cache
#history, thumbnails, and the currently playing video will be stored here
#(YTFZF_CACHE)
cache_dir="$HOME/.cache/ytfzf"

#the file for storing watch history
history_file="$cache_dir/watch.history"

#the file for storing search history
search_history_file="$cache_dir/search.history"

#fail to download history file
fail_history_file="$cache_dir/fail.history"

#the file for writing the menu option that was chosen
current_file="$cache_dir/watch.current"

#the folder where thumbnails are cached
thumb_dir="$cache_dir/thumb"

#the file where subscriptions are stored
subscriptions_file=$YTFZF_CONFIG_DIR/subscriptions

#####################
#   Basic Options   #
#####################

#useragent when using curl on youtube
useragent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.152 Safari/537.36"

#enable/disable history (enabled by default)
#history is stored in $history_file ($YTFZF_CACHE/ytfzf_hst by default, change $history_file to change this)
#(YTFZF_HIST)
enable_hist=1

#enable/disable looping (disabled by default)
#when enabled, after a video ends it will bring up the results menu again
#(YTFZF_LOOP)
enable_loop=1

#enable/disable writting the selected menu option to a file
#this file is $YTFZF_CACHE/ytfzf_cur by default, can be changed by changing $current_file
#(YTFZF_CUR)
enable_cur=1

#enable(1)/disable(0) notification when play video
#the notification is send via send-notify
#(YTFZF_NOTI)
enable_noti=0

#enable/disable ytfzf's use of your $FZF_DEFAULT_OPTS
#depending on your fzf settings, this could mess up the formatting of the menu
#(YTFZF_ENABLE_FZF_DEFAULT_OPTS)
enable_fzf_default_opts=1

#download the video instead of watching/listening
#same as -d
is_download=1

# this emulates the -m flag if set to 1
is_audio_only=0

#the player to use for playing the video, must be able to stream from youtube-dl
#vlc also works
#(YTFZF_PLAYER)
video_player="mpv"

#the player to use when choosing a video format with $YTFZF_PREF
#(YTFZF_PLAYER_FORMAT)
video_player_format="mpv --ytdl-format="

#the player to use for audio ( option -m )
#(YTFZF_AUDIO_PLAYER)
audio_player="mpv --no-video --ytdl-format=bestaudio"

#enable/disable showing the different video formats
#same as -f
show_format=0

#the side to show thumbnails
#options are "left", "right", "top", "bottom"
#same as --priview-side=
preview_side="right"

#where to source videos from
#options are: history, yt_subs, yt_search, trending, pt_search
#history is the same as -H
#yt_subs is the same as -S
#trending is the same as -T
#pt_search is the same as -P (searches peertube)
scrape="yt_search"

#sort videos, history, and subscriptions by date from newest to oldest
sort_videos_data=1

# Task Spooler
export TMPDIR=/tmp/ytfzf/ts
export TS_MAXFINISHED=12
mkdir -m 0700 -p $TMPDIR
ts -S 2

sep="==============================================================================="

ts_menu () {
    ts -l | sed '1d;s/]sh -c .*$//;s/[[:space:]].*\[/\t/' | \
            fzf -d'\t' --with-nth='2..' --preview='ts -c {1} | grep --line-buffered -v "^$"' \
            --preview-window='bottom,30%,nowrap,follow' \
            --bind='alt-q:execute(ts -k {1};ts -r {1}),alt-K:execute(ts -k {1}),alt-r:execute(
                cmd="$( ts -i {1} | grep "^Command: sh -c" | sed "s/^Command: sh -c //" )";
                lable="$( ts -l | grep "^"{1}" " | grep -o "\[.*\]sh -c" | sed "s/^\[//;s/\]sh -c//" )";
                ts -k {1};
                ts -r {1};
                ts -L "$lable" sh -c "$cmd";),alt-o:execute(
                url="$( ts -l | grep "^"{1}" " | sed "s/^.*]sh -c ytfzf --ts-run-cmd '"'"'//;s/'"'"' .*$//")";
                $BROWSER "$url";
                ),alt-u:execute(ts -u {1}),alt-i:execute(ts -i {1};echo "'$sep'";read),alt-c:execute(ts -c {1};read)'
}

# the command to run for tasks in task spooler
ts_run_cmd () {
    url="$1"
    title="$2"
    config="$3"
    now="$( date '+%Y-%m-%d %H:%M:%S' )"

    notify-send 'Beginning Download!' "$title"

    youtube-dl --newline --config-location "$config" --exec \
        "ffmpeg -i {} -c:v copy -c:a copy -metadata URL='$url' {}.tmp.mkv;mv -f {}.tmp.mkv {}" \
        "$url" \
        && msg='Download Complete!' \
        || { msg='Download Failed!'; \
        printf '%s\t%s\t%s' "$now" "$url" "$title" > "$fail_history_file"; exit 1; }

    printf '\n\n%s\n%s\n%s\n[%s]\n%s\n' "$msg" "$sep" "$title" "$url" "$sep"
    notify-send "$msg" "$title"
}

# Commands to interact with task spooler
case "$1" in
    '--ts-run-cmd') shift; ts_run_cmd "$@"; exit;;
    '-R') shift; ts "$@"; exit;;
    '-M') shift; ts_menu; exit;;
esac

#when this function is set it will be called instead of open_player,
#open_player handles downloading, and showing a video,
#when handle_urls is defined you get all the urls passed in, and can do whatever you want with them,
#you can call open_player yourself, as shown below
handle_urls () {
    data="$selected_data"
    ytdl_config="$XDG_CONFIG_HOME/youtube-dl/config"
    ytdl_pl_config="$XDG_CONFIG_HOME/youtube-dl/pl.config"

    if [ $is_download -eq 1 ];then
        titles="$( printf "%s" "$data" | awk -F"\t" '{printf "%s\n\n", $1}' )"
        notify-send 'Add to Download queue' "$titles"
    fi

    for url in $@; do
    # sometimes select_data is empty
    # let youtube-dl get the title as a fall back
    if [ -z "$data" ]; then
        title="$( youtube-dl --get-title "$1" 2>/dev/null | sed "s/'/'\"'\"'/g" )"
    else
        title="$( printf "%s" "$data" | sed -n '1p' | awk -F"\t" '{print $1}' | sed "s/'/'\"'\"'/g" )"
        data="$( printf '%s' "$data" | sed '1d' )"
    fi

	if [ $is_download -eq 0 ]; then
		if [ $is_audio_only -eq 0 ]; then
			setsid -f $video_player "$url"  $YTFZF_SUBT_NAME >/dev/null 2>&1
		else
			setsid -f $audio_player "$url"  $YTFZF_SUBT_NAME >/dev/null 2>&1
		fi
    else
        if echo "$url" | grep -c 'youtube.com/playlist'; then
            config="$ytdl_pl_config"
        else
            config="$ytdl_config"
        fi

        # add download to task spooler
        # runs ts_run_cmd function as task
        ts -L "$title" sh -c "$(basename $0) --ts-run-cmd '$url' '$title' '$config'"
	fi
    done
}



#####################
#  Search History   #
#####################

#enable/disable logging of search history
enable_search_hist=1

#enable/disable search history menu
#same as -q
enable_search_hist_menu=1

#prompt for search history menu
search_history_prompt="Search: "

#enable/disable launching menu if search history is empty
allow_empty_search_hist=1



#####################
#    Thumbnails     #
#####################

#enable/disable viewing of thumbnails (currently only works when using the X display manager)
#same as -t
show_thumbnails=1

# The thumbnail quality to download
# 0: low res thumbnails (faster)
# 1: better thumbnails (slower)
thumbnail_quality=0

#the method to use for displaying thumbnails
#valid options:
    #ueberzug
    #jp2a
    #jp2a-grey/gray
    #jp2a-4
    #jp2a-8
    #catimg
    #chafa
    #chafa-grey/gray
    #chafa-4
    #chafa-8
#(YTFZF_THUMB_DISP_METHOD)
thumb_disp_method="ueberzug"



#####################
#   Subscriptions   #
#####################

#stores the langauge for the auto generated subtitltes
#(YTFZF_SELECTED_SUB)
selected_sub=""

#the amount of links to get from each subscription
#same as --subs=
sub_link_count=10

#whether or not to show --------------channel---------------- when viewing subscriptions
#same as --fancy-subs=
fancy_subscriptions_menu=1

#the text template string to use for the fancy subscriptions divider,
#the spaces are for centering
fancy_subscriptions_text="             -------%s-------"

#############
# Key Binds #
#############

#the key binds to use in fzf
#the first 7 are used for
    # printing the urls
    # printing the title
    # openeing selected urls in a browser
    # watching the video
    # downloading the video
    # listening to the video
    # search again
    # detach player
#in that order, these keys can be changed
#any keys after will not have default behaviour and the behaviour can be defined in handle_custom_key_binds
#any undefined keys will be used for default selection behaviour
#
#Note: some parts of `key_binds` used to be handled by `shortcuts`,
#which is no longer supported
key_binds="alt-l,alt-t,alt-o,alt-v,alt-d,alt-m,alt-s,f9,alt-q,alt-enter,enter,double-click"

#this allows for the use of key_binds without leaving fzf
#therefore fzf does not have to reload and the selection does not get reset
#if you do not wish to use this behavior, simply leave this option blank
persistent_key_binds="enter,alt-enter,alt-v,alt-d,alt-o,double-click"

#if you wish to have persistent key binds when loop is not given enable this
#this will automatically be enabled with -l
enable_persistent_key_binds=1

#some helpful variables to keep in mind:
    #selected_key: they key_bind pressed
    #selected_urls: the selected urls
    #selected_data: the line that was selected
    #play_url: a function that takes a url and plays it (play_url "$url") 
#the return value matters in this function,
    #returning 0 will continue the program as normal
    #returning 1 will exit the program and will clean up after itself
    #returning 2 will restart the main loop (this is used for the search_again key_bind)
# 
#Note: `handle_custom_key_binds` used to be handled by `handle_custom_shortcuts`,
#which is no longer supported
handle_custom_key_binds () {
    case $selected_key in
        "alt-enter") is_download=0; is_audio_only=0; return 0;;
        "alt-q")
            unset videos_data search_query
            [ "$scrape" = "pt_search" ] && scrape_fn || scrape="yt_search" scrape_fn
	    return 2 ;;
    esac
    return 0
}
