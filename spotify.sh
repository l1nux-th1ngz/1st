#!/bin/bash

# Add Spotify GPG key and repository
curl -fsSL https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/spotify-archive-keyring.gpg > /dev/null

# Add Spotify repository
echo "deb [signed-by=/usr/share/keyrings/spotify-archive-keyring.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# Update package list and install Spotify client
sudo apt update && sudo apt-get -y install spotify-client

# Install Spicetify CLI
curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh

# Grant necessary permissions to Spotify files
sudo chmod 777 /usr/share/spotify
sudo chmod 777 /usr/share/spotify/Apps -R

echo -e "\n\e[0;32mSpotify and Spicetify have been installed.\e[0m"
