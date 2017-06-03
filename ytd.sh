 #!/ bin/zsh
if [[ -v YTDIR ]]; then
    :
else
    export YTDIR="$HOME/Desktop/Youtube"
fi
if [[ -d $YTDIR ]]; then
    :
else
    mkdir $YTDIR
fi
(
cd $YTDIR
youtube-dl -x --audio-format mp3 -i --no-playlist -o "%(title)s.%(ext)s" $(xclip -o)
)
