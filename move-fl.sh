#!/bin/bash

# Move 'scratch' to /usr/local/bin/ and make it executable
sudo mv scratch /usr/local/bin/
sudo chmod +x /usr/local/bin/scratch

# Move 'scratchpads_status.sh' to $XDG_CONFIG_HOME/polybar/
mkdir -p "$XDG_CONFIG_HOME/polybar"
mv scratchpads_status.sh "$XDG_CONFIG_HOME/polybar/"

# Move 'scripts' directory to .local/share/scripts
mkdir -p ~/.local/share/
mv scripts ~/.local/share/scripts

# Move 'setup_xinitrc_with_floating.sh' to ~/.local/bin/ and make it executable
mv setup_xinitrc_with_floating.sh ~/.local/bin/
chmod +x ~/.local/bin/setup_xinitrc_with_floating.sh
