#!/bin/bash

# Update package list and upgrade existing packages
sudo apt update && sudo apt upgrade -y

# Install necessary packages
sudo apt -y install bspwm sxhkd rofi nemo ranger polybar kitty alacritty xdg-user-dirs xdg-user-dirs-gtk

# Refresh Directories
xdg-user-dirs-update
xdg-user-dirs-gtk-update

# Required Dir for bspwm
mkdir -p ~/.config/bspwm
cp /etc/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
chmod 755 ~/.config/bspwm/bspwmrc

# Required Dir for sxhkd
mkdir -p ~/.config/bspwm/sxhkd
touch ~/.config/bspwm/sxhkd/sxhkdrc
chmod 644 ~/.config/bspwm/sxhkd/sxhkdrc

# Required Dir for rofi
mkdir -p ~/.config/bspwm/rofi
rofi -dump-config > ~/.config/bspwm/rofi/config.rasi

# Polybar Configuration
mkdir -p ~/.config/bspwm/polybar
cp /etc/polybar/config.ini ~/.config/bspwm/polybar/config.ini


# Install packages
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput xinit policykit-1-gnome x11-xserver-utils
sudo apt install -y build-essential git vim xcb libxcb-util0-dev xcb gcc mpv ncmpcpp check autotools-dev
sudo apt install -y libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev jq xdotool nala gparted python3
sudo apt install -y libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev neodetch
sudo apt install -y cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev bc npm xdg-utils
sudo apt install -y libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev wq toilet cmake-extras
sudo apt install -y libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libpulse-dev libjsoncpp-dev ytfzf
sudo apt install -y libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev libxcb-shape0-dev libuv1-dev libpng-dev libjpeg-dev libtiff-dev
sudo apt install -y libxext-dev libxcb-damage0-dev libxcb-xfixes0-dev libpixman-1-dev libdbus-1-dev xdo
sudo apt install -y libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev
sudo apt install -y dconf-editor suckles-tools scrot vlc git curl wget qbittorrent rxvt-unicode xclip pkg-config python3-sphinx
sudo apt install -y simplescreenrecorder geany geany-plugins playerctl brightnessctl yad lz4 dex fzf libxcb-ewmh2
sudo apt install -y intel-microcode dialog mtools dosfstools acpid gvfs-backends gvfs zenity ascii ffmpeg tint2
sudo apt install -y dmenu polybar numlockx rofi dunst libnotify-bin unzip xdg-user-dirs xdg-user-dirs-gtk roxterm-gtk2 
sudo apt install -y nemo ranger kitty alacritty pulseaudio alsa-utils pavucontrol volumeicon-alsa tumbler moc
sudo apt install -y neofetch htop network-manager network-manager-gnome lxappearance exa bluez blueman imagemagick
sudo apt install -y fonts-firacode fonts-liberation2 fonts-ubuntu papirus-icon-theme fonts-cascadia-code roxterm-common
sudo apt install -y asciidoctor ascii asciidoc figlet toilet-fonts atool wmctrl software-properties-common apt-transport-https
sudo apt install -y libltdl-dev libjpeg-dev libpng-dev libtiff-dev libgif-dev libfreetype6-dev liblcms2-dev libxml2-dev

# Enable services
sudo systemctl enable bluetooth
sudo systemctl enable avahi-daemon
sudo systemctl enable acpid
# Install deb-get 
curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get

# Install Deborah
sudo deb-get install deborah -y

# Install and configure picom
git clone https://github.com/dccsillag/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ..



# Install SDDM
sudo apt-get install sddm --no-install-recommends -y
sudo systemctl enable sddm
sudo systemctl start sddm

# Final message
echo "Setup complete. You may want to install additional web browsers now."
