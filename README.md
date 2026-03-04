# vm-collab-lockdown
This script was created Because some guy kept joining the debian collabVM virtual machine, messing with the resolution, and then rebooting just to be disruptive.
# What is does
- It sets the screen res to 1360x768;
- It disables the ability to turn off and reboot the machine by running /usr/bin/xfce4-session-logout by changing its permissions to 000.
- It disables the ability to change the screen geometry and dpi scaling by running /usr/bin/xfce4-display-settings by changing its permissions to 000.
- their utility can be restored by running ```$ sudo chmod 700 /usr/bin/xfce4-session-logout /usr/bin/xfce4-display-settings.
# Running instructions
- First, why exactly would anyone else but me want to run this?
- run ```$ chmod +x ./Lockdown.sh``` (assuming you are in the same directory as the script.)```
- Execute the script by running ```$ sudo bash ./Lockdown.sh```
