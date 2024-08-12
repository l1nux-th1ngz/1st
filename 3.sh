#!/bin/bash

set -e  # Exit on any error

# Install necessary packages
sudo apt update
sudo apt install -y build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev libuv1-dev

# Clone and install bspwm
cd ~/Downloads
git clone https://github.com/baskerville/bspwm.git
cd bspwm
make
sudo make install

# Configure bspwm
mkdir -p ~/.config/bspwm
cp examples/bspwmrc ~/.config/bspwm/
chmod +x ~/.config/bspwm/bspwmrc

# Clone and install sxhkd
cd ~/Downloads
git clone https://github.com/baskerville/sxhkd.git
cd sxhkd
make
sudo make install

# Install additional dependencies
sudo apt install -y cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

# Install Spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install -y spotify-client

# Install and configure Spicetify
curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh
sudo chmod a+wr /usr/share/spotify
sudo chmod a+wr /usr/share/spotify/Apps -R
spicetify
spicetify backup apply enable-devtool
spicetify update

# Install and apply Spicetify themes
cd ~/Downloads
git clone https://github.com/morpheusthewhite/spicetify-themes.git
cd spicetify-themes
cp -r * ~/spicetify-cli/Themes
cd ~/spicetify-cli/Themes/Dribbblish/
cp dribbblish.js ../../Extensions
spicetify config extensions dribbblish.js
spicetify config current_theme Dribbblish color_scheme nord-dark
spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
spicetify apply

# Install Alacritty
sudo apt install -y alacritty
mkdir -p ~/.config/alacritty
cp ~/Downloads/blue-sky/alacritty/alacritty.yml ~/.config/alacritty/
# Modify Alacritty launcher command
sed -i 's|Exec=alacritty|Exec=bash -c "LIBGL_ALWAYS_SOFTWARE=1 alacritty"|g' ~/.local/share/applications/alacritty.desktop

# Install feh and set wallpaper
sudo apt install -y feh
echo 'feh --bg-fill $HOME/Downloads/blue-sky/wallpapers/blue3.png' >> ~/.config/bspwm/bspwmrc

# Configure Rofi
mkdir -p ~/.config/rofi/themes
cp ~/Downloads/blue-sky/nord.rasi ~/.config/rofi/themes
rofi-theme-selector # preview the "nord theme" with Enter and apply it with Alt+a

# Modify keybindings
vim ~/.config/sxhkd/sxhkdrc

# Replace dmenu with Rofi
cd ~/Downloads/blue-sky
sudo cp slim.conf /etc
sudo cp slimlock.conf /etc
sudo cp default /usr/share/slim/themes

echo "Setup complete. Please restart your session to apply all changes."
