#!/usr/bin/env python

import sys
import os
import shutil

def main():
    force = "--force" in sys.argv
    if "--xprofile" in sys.argv:
        copy("xprofile", ".xprofile", force)
    if "--i3" in sys.argv:
        copy("i3/i3",".config/i3/config", force)
    if "--i3status" in sys.argv:
        copy("i3/i3status", ".config/i3status/config", force)
    if "--vimrc" in sys.argv:
        copy("vimrc", ".vimrc", force)

def copy(fr, to, force=False):
    print("Copy:",fr,"to",to)
    if force or not os.path.exists(os.environ["HOME"]+"/"+to):
        shutil.copyfile(fr,os.environ["HOME"]+"/"+to)
    else:
        print("Will not copy",fr,"to",to)

if __name__ == "__main__":
    main()
