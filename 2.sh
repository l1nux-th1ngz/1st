#!/bin/bash

# Move 'scratch' to /usr/local/bin/ and make it executable
sudo mv scratch /usr/local/bin/
sudo chmod +x /usr/local/bin/scratch

# Move 'scratchpads_status.sh' to $XDG_CONFIG_HOME/polybar/
mkdir -p "$XDG_CONFIG_HOME/polybar"
mv scratchpads_status.sh "$XDG_CONFIG_HOME/polybar/"

# Move 'scripts' directory to ~/.local/share/scripts
mkdir -p ~/.local/share/scripts
mv scripts ~/.local/share/scripts/

# Move 'setup_xinitrc_with_floating.sh' to ~/.local/bin/ and make it executable
mv setup_xinitrc_with_floating.sh ~/.local/bin/
chmod +x ~/.local/bin/setup_xinitrc_with_floating.sh

# Move 'sxhkdrc.txt' to ~/.config/bspwm/
mkdir -p ~/.config/bspwm
mv sxhkdrc.txt ~/.config/bspwm/sxhkdrc.txt

# Move 'bspwmrc.txt' to ~/.config/bspwm/
mv bspwmrc.txt ~/.config/bspwm/bspwmrc

# Ensure all moved files have correct permissions
chmod 644 ~/.config/bspwm/sxhkdrc.txt
chmod 644 ~/.config/bspwm/bspwmrc

# Autostart configuration (add these to .xinitrc or another appropriate autostart script)
# Example for .xinitrc:
echo 'sh ~/.local/bin/setup_xinitrc_with_floating.sh &' >> ~/.xinitrc
