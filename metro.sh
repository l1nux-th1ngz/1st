#!/bin/bash

# Create the directory if it doesn't exist
mkdir -p ~/.config/bspwm/rofi/themes/rofi-metro

# Change to the themes directory
cd ~/.config/bspwm/rofi/themes

# Clone the rofi-metro repository
git clone https://github.com/Dartegnian/rofi-metro ~/.config/bspwm/rofi/themes/rofi-metro

# Apply the rofi-metro theme
rofi -show drun -theme ~/.config/rofi/rofi-metro/start-screen.rasi

# Make the charms.sh script executable
chmod +x ~/.config/rofi/rofi-metro/charms.sh

# Run the charms.sh script
sh ~/.config/rofi/rofi-metro/charms.sh
