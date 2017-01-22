#!/bin/bash
source $HOME/.feh_constants.sh
if [ -f $HOME/.screenlayout/mega.sh ];
then
    sleep 2; source $HOME/.screenlayout/mega.sh
fi
while true; do
    case $(date +%H) in
        0[0-6])
            feh --bg-tile $TBG_NIGHT
            ;;
        0[7-9])
            feh --bg-tile $TBG_MORNING
            ;;
        1[0-4])
            feh --bg-tile $TBG_MIDDAY
            ;;
        1[5-8])
            feh --bg-tile $TBG_AFTERNOON
            ;;
        19)
            feh --bg-tile $TBG_EVENING
            ;;
        2*)
            feh --bg-tile $TBG_EVENING
            ;;
        *)
            # default == unreachable!
            i3-nagbar -m "error occurred in feh_update.sh"
            ;;
    esac
    if [ $1 = "now" ];
    then
        exit
    else
        sleep 5m
    fi
done
