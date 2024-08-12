#!/bin/bash

# Copy the default xinitrc to the home directory
cp /etc/X11/xinit/xinitrc ~/.xinitrc

# Make the ~/.xinitrc file executable
chmod +x ~/.xinitrc

# Add commands to launch kitty and bspwm to the ~/.xinitrc file
cat << EOF >> ~/.xinitrc

# Launch kitty terminal emulator
exec kitty &

# Start bspwm window manager
exec bspwm
EOF

# Verify the ~/.xinitrc file
stat ~/.xinitrc

# Execute the ~/.xinitrc file
~/.xinitrc
