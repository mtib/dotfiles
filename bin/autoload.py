#!/usr/bin/env python3
import poplib
import os
from email import parser
from ftplib import FTP

if __name__ == "__main__":
    cl = poplib.POP3_SSL("enter stuff here")
    cl.user("enter stuff here")
    cl.pass_("python")
    print("Connected")
    msgs = [cl.retr(i) for i in range(1, len(cl.list()[1])+1)]
    msgs = ["\n".join([m.decode("UTF-8") for m in msg[1]]) for msg in msgs]
    msgs = [parser.Parser().parsestr(msg) for msg in msgs]
    for message in msgs:
        for p in message.walk():
            if p.get_content_disposition() in ["inline", "attachment"]:
                fn = p.get_filename()
                pl = p.get_payload(decode=True)
                print(message["subject"],">", fn)
                print(" > Data:", len(pl), "bytes")
                with open(message["subject"], "wb") as f:
                    f.write(pl)
    cl.quit()
    with FTP("enter stuff here", "enter stuff here", "enter stuff here") as ftp:
        ftp.cwd("enter stuff here")
        files = [x[0] for x in ftp.mlsd()]
        local_files = [x[2] for x in os.walk(".")][0]
        for lf in local_files:
            if lf in files:
                continue
            with open(lf, "rb") as f:
                ftp.storbinary("STOR "+lf, f)

    print("Disconnected")
