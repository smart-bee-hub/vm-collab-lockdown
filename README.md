# vm-collab-lockdown
This script was created Because some guy kept joining the debian collabVM virtual machine, messing with the resolution, and then rebooting just to be disruptive.
# What is does
- It sets the screen res to 1360x768;
- It disables the ability to turn off and reboot the machine by the xfce logout app by changing its permissions to 000.
- It disables the screen config app by changing its permissions to 000.
- It disables the log out screen app by changing its permissions to 000.
# Running instructions
- First, why exactly would anyone else but me want to run this?
- run ```$ chmod +x ./Lockdown.sh``` (assuming you are in the same directory as the script.)
- Execute the script by running ```$ sudo ./Lockdown.sh```
