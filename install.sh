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
  echo '#             ####  Project:Terminal Config App    #####                      # '
  echo '#                                                                             # '
  echo '############################################################################### '
}
function install_terminal() 
{
    if [[ "$package_manager" == "pacman" ]];
    then
        echo -ne "
-------------------------------------------------------------------------
          Arch System or Arch Based System              
-------------------------------------------------------------------------
" 
        install_paru
        install_arch
        change_shell
        config_terminal
        omf-framework
    elif [[ "$package_manager" == "apt-get" ]];
    then
        echo -ne "
-------------------------------------------------------------------------
            Debian System or Debian Based System  
-------------------------------------------------------------------------"
        install_debian
        change_shell
        config_terminal
        omf-framework
    else
        echo -ne "
-------------------------------------------------------------------------
                Sorry!! Error Occured: ${package_manager}
-------------------------------------------------------------------------
" 
        exit 0
    fi    
}
function install_paru()
{
    echo -ne "
-------------------------------------------------------------------------
                    Installing Paru AUR  
-------------------------------------------------------------------------
"
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ../    
}
function install_arch() 
{
    echo -ne "
-------------------------------------------------------------------------
                    Updating System  
-------------------------------------------------------------------------
"
    sudo pacman -Syyu --noconfirm --needed
    paru -Syyu --noconfirm --needed

    echo -ne "
-------------------------------------------------------------------------
                    Install Terminal Alacritty  
-------------------------------------------------------------------------
"
    sudo pacman -S alacritty --noconfirm --needed

    echo -ne "
-------------------------------------------------------------------------
                    Install Fish Shell 
-------------------------------------------------------------------------
"
    sudo pacman -S fish --noconfirm -needed

    echo -ne "
-------------------------------------------------------------------------
                    Install Neofetch  
-------------------------------------------------------------------------
"
    sudo pacman -S neofetech --noconfirm --needed
 
    echo -ne "
-------------------------------------------------------------------------
                    Install Figlet Application  
-------------------------------------------------------------------------
"

    sudo pacman -S figlet --noconfirm --needed
 
    echo -ne "  
-------------------------------------------------------------------------
                    Install Font for the terminal 
-------------------------------------------------------------------------
"
    paru -S nerd-fonts-mononoki --noconfirm --needed
}
function install_debian()
{
        echo -ne "
-------------------------------------------------------------------------
                    Updating System  
-------------------------------------------------------------------------
"
    sudo apt-get update && sudo apt-get upgrade -y
 
    sudo apt-get install fish -y
 
     echo -ne "
-------------------------------------------------------------------------
                    Install Neofetch  
-------------------------------------------------------------------------
"
    sudo apt-get install neofetch -y
 
    echo -ne "  
-------------------------------------------------------------------------
                    Install Font for the terminal 
-------------------------------------------------------------------------
"
    sudo apt install fonts-powerline -y
    sudo apt install fonts-font-awesome -y
    sudo apt install fonts-mononoki -y

    echo -ne "
-------------------------------------------------------------------------
                    Install Figlet Application  
-------------------------------------------------------------------------
"
    echo -ne "
-------------------------------------------------------------------------
                    Install Fish Shell 
-------------------------------------------------------------------------
"
    sudo apt-get install figlet -y

    echo -ne "
-------------------------------------------------------------------------
                    Install Terminal Alacritty  
-------------------------------------------------------------------------
" 
    sudo dpkg -i Alacritty.deb
}
function change_shell() 
{ 
    echo -ne "
-------------------------------------------------------------------------
                Changing Default Shell  
-------------------------------------------------------------------------
"  
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
function omf-framework()
{
    echo -ne "
-------------------------------------------------------------------------
                Applying the oh-my-fish framework  
-------------------------------------------------------------------------
"  
    # with git
    git clone https://github.com/oh-my-fish/oh-my-fish
    cd oh-my-fish
    bin/install --offline
    # with a tarball
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
    fish install --offline=omf.tar.gz
    cd ../
}
function nonroot()
{   

    if [ "$USER" = root ]; then
            echo -ne "
-------------------------------------------------------------------------
            This script shouldn't be run as root. Aborting.
            Run script like this:-   ./install.sh
-------------------------------------------------------------------------
"
           exit 1
    fi
}
#Beginning Of the script
function run() 
{
    #check no root for this file
    nonroot
 
    #welcome message
    welcome

    #Installing Terminal
    install_terminal
}
run
