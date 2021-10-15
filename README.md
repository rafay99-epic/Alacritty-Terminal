# Alacritty Terminal Config Files:

These are the config files for the Alacritty terminal, These file are config in a way to have a border-less appearance an with transparent background.

# Installment:

In order to config your terminal you must have a couple of things installed on your systems.

## Alacritty Terminal:

You must have alacritty terminal installed on you system, if you don't installed on your system then enter the following command to install the terminal:

**Arch:**

Install the application using the following command

```bash
sudo pacman -S alacritty
```

**Debian System:**

1. Add the repo in your system

```bash
sudo add-apt-repository ppa:aslatter/ppa
```

1. Install the Application

```bash
sudo apt install alacritty
```

## Required fonts:

Once the application is installed then you need the install the following font 'Mononoki Nerd Font'

**Install font on Arch:**

```bash
yay -S nerd-fonts-mononoki
```

**Install font on Debian System:**

1. Get the files from the Github

```bash
git clone https://github.com/ryanoasis/nerd-fonts.git
```

1. Once all of the files on your system then enter the following command to install the font

```bash
./install.sh mononoki
```

## Fish Shell:

you need to install the fish shell as well. 

**For Arch System:**

```bash
	sudo pacman -Sy fish
```

**For Debian system:**

```bash
sudo apt-get install fish
```

Once the fish shell is installed on your system then we need themes fro this shell.

## Oh-my-Fish(omf)

To get themes we need the omf themes to install omf fish themes enter the following command:

```bash
curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf
```

## Couple of Programs:

### Installing figlet

**for Arch Linux:**

```bash
sudo pacman -Syyu figlet
```

for Debian System:

1. Update the system

```bash
sudo apt-get update -y
```

1. Installing the applications

```bash
sudo apt-get install -y figlet
```

### Installing Neofetch

**For Arch System:**

```bash
sudo pacman -Syyu neofetch
```

**For Debian System:**

```bash
sudo apt-get update
sudo apt install neofetch
```

## **Config the files:**

Once all of the font and application are installed, now you want to config the application.

1. Download the config the files from GitHub

```bash
git clone https://github.com/rafay99-epic/Alacritty-Terminal-file.git
```

1. Now open your file manager and go to your home directory , Once opened then press 'Ctrl + h' to show all of the hidden files.
2. Once all of the files are visible then find the '.config' files.

### **Configuring Alacritty Terminal:**

1. In that file delete the Alacritty folder.
2. Copy the Alacritty folder from the GitHub pages and paste the folder in the config file.

### **Config the Fish shell:**

1. Open the  .config file find the delete fish folder.
2. then copy the fish folder called 'Alacritty-Terminal-file/Shell/Fish shell & theme/Fish shell/ ' in that you will find a folder called ' fish'.
3. Copy the folder and the paste the folder into the .config folder

### Config and Installing the Theme:

1. In the same config directory delete the omf folder and the copy the omf folder from Alacritty-Terminal-file/Shell/Fish shell & theme/omf theme.
2. Paste the new copied folder into the config folder.

### Config the Neofetch:

1. In the same directory called .config delete the neofetch folder.
2. copy the new neofetch folder from thr github and paste it into the config folder.

## Changing your default shell:

In order to change your default shell enter the following command:

```bash
chsh -l 
chsh -s /bin/fish
```

## Final Result:

Your terminal will look like this the shell be different but the terminal will have border less look

![Screenshot from 2021-10-16 00-04-24](https://user-images.githubusercontent.com/82662797/137545555-65687881-ae14-4e1b-ac58-654235160fb9.png)
