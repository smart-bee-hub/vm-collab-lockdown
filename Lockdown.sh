#!/bin/bash

# Ensure script is executed as root
if [ "$EUID" -ne 0 ]; then
  echo "Execution requires root privileges. Please run with sudo."
  exit 1
fi

REAL_USER=$SUDO_USER

# 1. Display Geometry Configuration
# Detects the active monitor and forces the 1360x768 mode
MONITOR=$(xrandr | grep " connected" | cut -f1 -d" ")
xrandr --output "$MONITOR" --mode 1360x768
sleep 2

# 2. Neutralize Xfce Settings and Session Binaries for everyone, which is reversible
# This prevents the GUI from launching display sttings settings or the logout/reboot/shutdown dialog
# Note: This does NOT stop the user from 'sudo reboot' or 'sudo poweroff' from a terminal
chmod 000 /usr/bin/xfce4-display-settings
chmod 000 /usr/bin/xfce4-session-logout

#3. notify the users about the script
cat << 'EOF' >> /home/dartz/.bashrc

echo "A user named beezled ran a script to stop people from creating chaos through power and display settings."
echo "Using the GUI display settings and the session log out apps will not be usable until you change their permissions"
echo "By running sudo chmod 755 /usr/bin/xfce4-display-settings and /usr/bin/xfce4-session-logout "
echo "Rebooting and changing the display settings through the terminal are unaffected. Contact me on Discord"
echo "@beezled for any questions."
echo "Information on the script available at"
echo "https://github.com/smart-bee-hub/vm-collab-lockdown/"

EOF

echo "screen Settings and Logout disabled. Terminal power commands remain functional."

#Delete the script
rm /home/dartz/Lockdown.sh

exit 0
