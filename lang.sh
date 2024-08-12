#!/bin/bash

sudo apt-get -y install python3-full python3-pip libpangocairo-1.0-0 python3-cffi python3-xcffib

# Setup Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile complete --default-toolchain nightly

# Install Go
wget https://go.dev/dl/go1.22.6.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.22.6.linux-amd64.tar.gz
rm go1.22.6.linux-amd64.tar.gz

# Add Go to PATH in .profile and .bashrc
echo 'export PATH=/usr/local/go/bin:$PATH' | tee -a $HOME/.profile
echo 'export PATH=/usr/local/go/bin:$PATH' >> ~/.bashrc

# NodeJS
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && sudo apt install nodejs -y

# Source .profile and .bashrc to update the current session
source $HOME/.profile
source ~/.bashrc

# Setup Lua
curl -L -R -O https://www.lua.org/ftp/lua-5.4.7.tar.gz
tar zxf lua-5.4.7.tar.gz
cd lua-5.4.7
make all test
cd ..
rm lua-5.4.7.tar.gz

# Setup Perl
wget https://www.cpan.org/src/5.0/perl-5.40.0.tar.gz
tar -xzf perl-5.40.0.tar.gz
cd perl-5.40.0
./Configure -des -Dprefix=/usr/local
make
sudo make install
cd ..
rm perl-5.40.0.tar.gz

# Setup rbenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
