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

# 2. Neutralize Xfce Settings and Session Binaries
# This prevents the GUI from launching display sttings settings or the logout/reboot/shutdown dialog.
# Note: This does NOT stop 'sudo reboot' from a terminal.
chmod 000 /usr/bin/xfce4-display-settings
chmod 000 /usr/bin/xfce4-session-logout

# 3. Explain how to turn off and reboot the machine through the terminal
echo 'echo "A little script was ran by beezled, which is supposed to stop people from purposefully creating disturbances via the display settings and the log out screen. Using the gui display settings and the session log out apps will not be available unless you change the permissions of the xfce4-display-settings and xfce4-session-logout binaries that are in /usr/bin/. Rebooting and changing the display settings through the terminal are unaffected. contact me on discord for any question"' >> /home/dartz/.bashrc 

echo "screen Settings and Logout disabled. Terminal power commands remain functional."

exit 0
