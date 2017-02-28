#!/bin/zsh
i3-input -F 'exec "mkdir -p \"$HOME/Pictures/screenshots\"; scrot -s \"$HOME/Pictures/screenshots/%s.png\"; xclip -selection clipboard -t image/png -i \"$HOME/Pictures/screenshots/%s.png\""' -P "Image Name: " -f Hasklig
