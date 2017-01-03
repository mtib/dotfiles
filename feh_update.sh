#!/bin/bash
source $HOME/.feh_constants.sh
while true; do
    case $(date +%H) in
        0[0-6])
            feh --bg-tile $TBG_NIGHT
            ;;
        0[7-9])
            feh --bg-tile $TBG_MORNING
            ;;
        1[0-6])
            feh --bg-tile $TBG_MIDDAY
            ;;
        1[7-9])
            feh --bg-tile $TBG_AFTERNOON
            ;;
        2*)
            feh --bg-tile $TBG_EVENING
            ;;
        *)
            # default == unreachable!
            i3-nagbar -m "error occurred in feh_update.sh"
            ;;
    esac
    sleep 5m
done
