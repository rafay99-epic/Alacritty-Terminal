#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */

declare -A osInfo;
osInfo[/etc/debian_version]="apt-get"
osInfo[/etc/alpine-release]="apk"
osInfo[/etc/centos-release]="yum"
osInfo[/etc/fedora-release]="dnf"
osInfo[/etc/arch-release]="pacman"

#to find the which Os yo are running
for f in ${!osInfo[@]}
do
    if [[ -f $f ]];
    then
        package_manager=${osInfo[$f]}
    fi
done

function welcome()
{
  echo '############################################################################### '
  echo '#                                                                             # '
  echo '#             ####  Author: Mohammad Abdul Rafay   #####                      # '
  echo '#             ####  Email : 99marafay@gmail.com    #####                      # '
  echo '#             ####  GitHub: rafay99-epic           #####                      # '
  echo '#             ####  Project:The App.js File        #####                      # '
  echo '#                                                                             # '
  echo '############################################################################### '
}
function install_terminal() 
{
    if [[ "$package_manager" == "pacman" ]];
    then
        install_arch
        change_shell
        config_terminal
    elif [[ "$package_manager" == "apt-get" ]];
    then
         install_debian
         change_shell
         config_terminal
    else
        echo 'Error Occured: ${package_manager}'
        exit 0
    fi    
}
function install_arch() 
{
    sudo pacman -S yay --noconfirm --needed
    sudo pacman -S alacritty --noconfirm --needed
    sudo pacman -S fish --noconfirm -needed
    sudo pacman -S neofetech --noconfirm --needed
    sudo pacman -S figlet --noconfirm --needed
    yay -S nerd-fonts-mononoki --noconfirm --needed
}
function install_debian()
{
    sudo apt-get install fish -y
    sudo apt install fonts-mononoki -y
    sudo apt-get install neofetch -y
    sudo apt install fonts-powerline -y
    sudo apt install fonts-font-awesome -y
    sudo apt-get install figlet -y
    sudo dpkg -i Alacritty.deb
}
function change_shell() 
{   
    if [[ "$package_manager" == "pacman" ]];
    then
        chsh -s /bin/fish
    elif [[ "$package_manager" == "apt-get" ]];
    then
        chsh -s /usr/bin/fish
    else
        echo 'Error Occured: ${package_manager}'
        exit 0
    fi  
}
function config_terminal()
{
    cp -r fish alacritty ~/.config
}
function nonroot()
{
    if [ "$USER" = root ]; then
        echo "This script shouldn't be run as root. Aborting."
        echo "Run script like this:-   ./install.sh"
        exit 1
    fi
}
function run() 
{
    #welcome message
    welcome

    #check no root for this file
    nonroot

    #Installing Terminal
    install_terminal
}
run