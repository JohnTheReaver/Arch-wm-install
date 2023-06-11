#!/bin/bash

#display figlet bulbhead font:
echo ' ____  _    _  __  __     ____  _  _  ___  ____   __    __    __   
(  _ \( \/\/ )(  \/  )___(_  _)( \( )/ __)(_  _) /__\  (  )  (  )  
 )(_) ))    (  )    ((___)_)(_  )  ( \__ \  )(  /(__)\  )(__  )(__ 
(____/(__/\__)(_/\/\_)   (____)(_)\_)(___/ (__)(__)(__)(____)(____)
'

#ask for root perms:
echo "This script requires root."
sudo echo ""

#install neccesary packages:
sudo pacman -Syu --noconfirm > /dev/null
echo "Updating packages..."
sudo pacman -Sy --noconfirm nano vim neofetch git libxft libxinerama ttf-jetbrains-mono ttf-font-awesome xorg-xrandr xwallpaper feh python-pywal xdotool zsh xcompmgr qutebrowser openssh figlet > /dev/null
echo "Installing packages..."

#making & going to .local/src
mkdir -p ~/.local/src/
cd ~/.local/src/
echo "Making directory: ~/.local/src/ ..."

#git clone dwm, dmenu & st:
git clone https://github.com/Bugswriter/dwm.git > /dev/null
echo "Cloning dwm from Bugswriter..."
git clone https://github.com/Bugswriter/dmenu.git > /dev/null
echo "Cloning dmenu from Bugswriter..."
git clone https://github.com/Bugswriter/st.git > /dev/null
echo "Cloning st from Bugswriter..."

#going to the cloned folders & running make install:
cd dwm
echo "Installing dwm..."
sudo make clean install > /dev/null
cd ..
cd dmenu
echo "Installing dmenu..."
sudo make clean install > /dev/null
cd ..
cd st
echo "Installing st..."
sudo make clean install > /dev/null
cd ..

#copy xinitrc to ~/.xinitrc & edit .xinitrc:
echo "Adding ~/.xinitrc ..."
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo "Removing last lines from twm..."
sed -i '/^twm/,$d' ~/.xinitrc
echo 'Adding "exec dwm" to ~/.xinitrc...'
echo "exec dwm" >> ~/.xinitrc

#display done:
echo "Install done!"
echo 'You may now start dwm and use "o" install script.'
sleep 3

#start dwm
echo "Starting dwm..."
sleep 1
startx &
