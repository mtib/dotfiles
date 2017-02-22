#!/bin/bash
d="$(spotify-now -i '%title - %artist' 2>/dev/null)"
case $d in
    "- Ad")
        echo ""
        ;;
    *)
        echo $d
        ;;
esac
