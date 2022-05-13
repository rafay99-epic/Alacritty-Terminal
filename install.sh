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

#Location for Paru
PARU=/usr/bin/paru

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
        install_paru
        install_arch
        change_shell
        config_terminal
        starship_promote
        fm6000-program
        # omf-framework
        bye
    elif [[ "$package_manager" == "apt-get" ]];
    then
        echo -ne "
-------------------------------------------------------------------------
            Debian System or Debian Based System  
-------------------------------------------------------------------------"
        install_debian
        change_shell
        config_terminal
        starship_promote
        fm6000-program
        # omf-framework
        bye
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
    if [ ! -e "$PARU" ]; 
        then
            # Installing Paru 
            echo -ne "
-------------------------------------------------------------------------
                   Installing Paru AUR  
-------------------------------------------------------------------------
            "
            git clone https://aur.archlinux.org/paru.git
            cd paru
            makepkg -si
            cd ../
        else
               echo -ne "
 -------------------------------------------------------------------------
                    Paru Exists
-------------------------------------------------------------------------
                "
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
    sudo pacman -S fish --noconfirm --needed

    echo -ne "
-------------------------------------------------------------------------
                    Install Neofetch  
-------------------------------------------------------------------------
"
    sudo pacman -S neofetch --noconfirm --needed
 
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
    paru -S ttf-meslo-nerd-font-powerlevel10k --noconfirm --needed
    paru -S nerd-fonts-meslo --noconfirm --needed
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
                    Install Neofetch  
-------------------------------------------------------------------------
"
    sudo apt-get install neofetch -y
 
    echo -ne "  
-------------------------------------------------------------------------
                    Install Font for the terminal 
-------------------------------------------------------------------------
"
    sudo apt-get install fonts-powerline -y
    sudo apt-get install fonts-font-awesome -y
    sudo apt-get install fonts-mononoki -y
    sudo apt-get install fontconfig -y
    
    cd ~
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
    mkdir -p .local/share/fonts
    unzip Meslo.zip -d .local/share/fonts
    cd .local/share/fonts
    rm *Windows*
    cd ~
    rm Meslo.zip
    fc-cache -fv
    cd Alacritty-Terminal 
    
    echo -ne "
-------------------------------------------------------------------------
                    Install Figlet Application  
-------------------------------------------------------------------------
"
    sudo apt-get install figlet -y
    echo -ne "
-------------------------------------------------------------------------
                    Install Fish Shell 
-------------------------------------------------------------------------
"
    sudo apt-get install fish -y

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
        echo -ne "
-------------------------------------------------------------------------
            Moving Config Files & Font files  
-------------------------------------------------------------------------
"
    cp -r fish alacritty ~/.config
    cp -r NerdFonts  ~/.local/share
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
function fm6000-program()
{
    echo -ne "
-------------------------------------------------------------------------
            Install fm-master-6000  
-------------------------------------------------------------------------
"
    sh -c "$(curl https://raw.githubusercontent.com/anhsirk0/fetch-master-6000/master/install.sh)"
}
function starship_promote()
{
    curl -sS https://starship.rs/install.sh | sh
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
