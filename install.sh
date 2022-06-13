#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */

declare -A osInfo;
osInfo[/etc/debian_version]="apt-get"
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
  echo '###################################################################################### '
  echo '#                                                                                    # '
  echo '#                 ####  Author: Mohammad Abdul Rafay          #####                  # '
  echo '#                 ####  Email : 99marafay@gmail.com           #####                  # '
  echo '#                 ####  GitHub: rafay99-epic                  #####                  # '
  echo '#                 ####  Project: Alacritty Terminal Config    #####                  # '
  echo '#                                                                                    # '
  echo '###################################################################################### '
}

function bye() 
{
    echo -ne "
-------------------------------------------------------------------------
          Thank You For Using this Script!!
          
          All Done...✨Congratulation✨              
-------------------------------------------------------------------------
" 
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
        install_arch
        config_terminal
        choose_shell
        reboot_now
    elif [[ "$package_manager" == "apt-get" ]];
    then
        echo -ne "
-------------------------------------------------------------------------
            Debian System or Debian Based System  
-------------------------------------------------------------------------"
        install_debian
        config_terminal
        choose_shell
        reboot_now
    else
        echo -ne "
-------------------------------------------------------------------------
                Sorry!! Error Occured: ${package_manager}
-------------------------------------------------------------------------
" 
        exit 0
    fi    
}

function install_arch() 
{
    echo -ne "
-------------------------------------------------------------------------
                    Updating System  
-------------------------------------------------------------------------
"
    sudo pacman -Syyu --noconfirm --needed

    echo -ne "
-------------------------------------------------------------------------
                    Install Terminal Alacritty  
-------------------------------------------------------------------------
"
    sudo pacman -S alacritty --noconfirm --needed
 
}
function install_debian()
{
    echo -ne "
-------------------------------------------------------------------------
                    Updating System  
-------------------------------------------------------------------------
"
    sudo apt-get update && sudo apt-get upgrade -y
   
    echo -ne "
-------------------------------------------------------------------------
                    Install Terminal Alacritty  
-------------------------------------------------------------------------
" 
    sudo dpkg -i Alacritty.deb

}
function config_terminal()
{   
        echo -ne "
-------------------------------------------------------------------------
            Moving Config Files for Terminal Alacritty 
-------------------------------------------------------------------------
"
    cp -r fish alacritty ~/.config
}


function choose_shell()
{
    echo -ne "
-------------------------------------------------------------------------
                --- Choose your Shell ---
        --- Enter from the Following options: ---
        --- 1. Fish Shell ---
        --- 2. ZSh Shell  ---
-------------------------------------------------------------------------
"   
    read -p "
-------------------------------------------------------------------------
            --- Note: use all small caps ---
            --- Enter your Choice ---
-------------------------------------------------------------------------
"  user_choice

    if [[ "$user_choice" == "fish" ]];
    then
        git clone https://github.com/rafay99-epic/Fish-Shell.git
        cd Fish-Shell
        ./install.sh
    elif [[ "$user_choice" == "zsh"  ]];
    then     
        git clone https://github.com/rafay99-epic/ZSH-Shell.git
        cd ZSH-Shell
        ./install.sh
    else
        echo -ne "
-------------------------------------------------------------------------
            --- Sorry You must Choose shell ---
-------------------------------------------------------------------------
"  
        clear
        choose_shell
    fi
}   

function reboot_now()
{   
    echo -ne "
-------------------------------------------------------------------------
                --- A Reboot is Required ---
        --- Enter from the Following options: ---
        --- 1. Yes for Reboot system ---
        --- 2. No for Exit the application ---
-------------------------------------------------------------------------
"
    echo -ne "
-------------------------------------------------------------------------
            --- Enter your Choice ---
-------------------------------------------------------------------------
"
    read -p  user_choice

    if [[ "$user_choice" == "yes" || "$user_choice" == "Yes" || "$user_choice" == "YES" || "$user_choice" == "yEs" || "$user_choice" == "yeS"  ]];
    then
        reboot
    elif [[ "$user_choice" == "no" || "$user_choice" == "No" || "$user_choice" == "nO" || "$user_choice" == "NO" ]];
    then     
        bye
        exit 0
    else
        bye
        exit 0
    fi
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
