#!/usr/bin/env python

import sys
import os
import shutil

def main():
    force = "--force" in sys.argv
    def norm(fln):
        regist("--"+fln, fln, "."+fln, force)
    norm("xprofile")
    norm("zprofile")
    norm("xinitrc")
    norm("zshrc.local")
    norm("vimrc")
    regist("--i3", "i3/i3", ".config/i3/config", force)
    regist("--i3status", "i3/i3status", ".config/i3status/config", force)
    if "--volume" in sys.argv:
        print("copying volume scripts requires root access")
        print("it will overwrite old files if there are any")
        if force:
            print("quitting because --force is not set")
        while True:
            ok = str(input("Continue? [y/n]"))
            if ok.lower() == "y":
                break
            elif ok.lower() == "n":
                return
        for fi in ["louder.sh", "quieter.sh"]:
            try:
                os.makedirs("/usr/share/i3scripts")
            except:
                pass
            shutil.copyfile(fi, "/usr/share/i3scripts/"+fi) 

def regist(cmd, frm, to, frc):
    if cmd in sys.argv:
        copy(frm, to, frc)

def copy(fr, to, force=False):
    print("Copy:",fr,"to",to)
    if force or not os.path.exists(os.environ["HOME"]+"/"+to):
        shutil.copyfile(fr,os.environ["HOME"]+"/"+to)
    else:
        print("Will not copy",fr,"to",to)

if __name__ == "__main__":
    main()
