#!/bin/bash

#This program checks whether  the website (I'm using the free site Weebly) starts with the yesflag or the noflag.
#If the website contains the yesflag, then it creates a blank file (rebootfile) to say that it's been
#rebooted (to prevent a boot loop), which gets reset once it sees the noflag again.

website = "http://______.weebly.com/reboot.html"
rebootfile = "/root/scripts/reboot"
yesflag = "beepyes"
noflag = "boopno"

if [[ $(echo $((w3m -dump $website) | cut -d ' ' -f 1)) == $yesflag* ]] && ls $rebootfile >/dev/null 2>&1 ;then rm $rebootfile; /sbin/reboot >> /root/scripts/reboot.log; elif [[ $(echo $((w3m -dump $website) | cut -d ' ' -f 1)) == $noflag* ]]; then touch $rebootfile;fi;