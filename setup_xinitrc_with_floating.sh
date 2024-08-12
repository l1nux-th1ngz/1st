#!/bin/bash

# Save the floating window script to ~/.local/bin/floating_windows.sh
cat << 'EOF' > ~/.local/bin/floating_windows.sh

# change the desktop number here
FLOATING_DESKTOP_ID=$(bspc query -D -d '^3')

bspc subscribe node_add | while read -a msg ; do
   desk_id=${msg[2]}
   wid=${msg[4]}
   [ "$FLOATING_DESKTOP_ID" = "$desk_id" ] && bspc node "$wid" -t floating
done

EOF

# Make the floating window script executable
chmod +x ~/.local/bin/floating_windows.sh

# Copy the default xinitrc to the home directory
cp /etc/X11/xinit/xinitrc ~/.xinitrc

# Make the ~/.xinitrc file executable
chmod +x ~/.xinitrc

# Add commands to launch kitty, run the floating window script, and start bspwm
cat << EOF >> ~/.xinitrc

# Run floating windows script on Desktop 3
~/.local/bin/floating_windows.sh &

# Launch kitty terminal emulator
exec kitty &

# Start bspwm window manager
exec bspwm
EOF

# Verify the ~/.xinitrc file
stat ~/.xinitrc

# Execute the ~/.xinitrc file
~/.xinitrc
