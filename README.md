# vm-collab-lockdown
This script was created Because some guy kept joining the debian collabVM virtual machine, messing with the resolution, and then rebooting just to be disruptive.

# What it does
- It sets the screen res to 1360x768;
- It disables the ability to turn off and reboot the machine by running /usr/bin/xfce4-session-logout by changing its permissions to 000.
- It disables the ability to change the screen geometry and dpi scaling by running /usr/bin/xfce4-display-settings by changing its permissions to 000.
- Adds an echo command in the .bashrc of the dartz user mentionning information about this script.
- their utilities can be restored by running ```$ sudo chmod 755 /usr/bin/xfce4-session-logout /usr/bin/xfce4-display-settings.```

# What it DOOESN'T do
- Prevent the system from rebooting or shutting down.
- Cause any permanent harm to the system/install.
- Dinamically use correct directories based on the user, meaning it will only work if your username is dartz.

# Running instructions
- First, why exactly would anyone else but me want to run this?
- Clone the repo by running ```$ git clone https://github.com/smart-bee-hub/vm-collab-lockdown.git```
- Cd into the cloned repo ```$ cd vm-collab-lockdown/```
- Run ```$ chmod +x ./Lockdown.sh``` (assuming you are in the same directory as the script.)
- Execute the script by running ```$ sudo bash ./Lockdown.sh```

# Clarifications 
- This is made only for use on the vm3 virtual machine on CollabVM, meaning it assumes that your Desktop Environment is XFCE and that your username is 'dartz'.
- This is not made to be intrusive, changes can be reversed on the machine by simply changing the permissions of the affected binaries to be able to be ran by non root users, and by changing the .bashrc, i don't care enough to provide an uninstallation script at the momment, perhaps in the future, or you can make one yourself and do a pull request.
