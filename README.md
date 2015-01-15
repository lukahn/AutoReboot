# AutoReboot
Shell Script for automatically rebooting a server by using a website variable. For when you can no longer SSH and want to reboot remotely.

I've added this file to /root/scripts and set it to run in cron every minute.

$ sudo su -
$ crontab -e

Then append the following:

# Reboots pi. Checks every minute.
* * * * * /root/scripts/autoreboot.sh 2>&1 /root/scripts/cronoutput.log