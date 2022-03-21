mpvmusic ()
{
mpv --no-config --volume=80 --volume-max=150 --ytdl-format=bestaudio --input-conf=~/.config/mpv/input.conf "$1"
}

alias mpvi='mpv --config-dir=$HOME/.config/mpvi '
