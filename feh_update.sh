#!/bin/bash
source $HOME/.feh_constants.sh
# if [ -f $HOME/.screenlayout/mega.sh ];
# then
#     # wait times
#     # 5 | works 40%
#     # 6 | works 50%
#     # 10 | works 0%
#     #source $HOME/.screenlayout/mega.sh
#     # use $mod+s l instead...
#     # maybe this can be put into
#     # /etc/X11/Xsession.d/ or the delay has to be longer...
#     :
# fi
while true; do
    case $(date +%H) in
        0[0-6])
            feh --bg-scale $TBG_NIGHT
            ;;
        0[7-9])
            feh --bg-scale $TBG_MORNING
            ;;
        1[0-4])
            feh --bg-scale $TBG_MIDDAY
            ;;
        1[5-8])
            feh --bg-scale $TBG_AFTERNOON
            ;;
        19)
            feh --bg-scale $TBG_EVENING
            ;;
        2*)
            feh --bg-scale $TBG_EVENING
            ;;
        *)
            # default == unreachable!
            i3-nagbar -m "error occurred in feh_update.sh"
            ;;
    esac
    if [ $1 = "now" ];
    then
        return;
    else
        sleep 5m
    fi
done
