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

## **Config the files:**

Once all of the font and application are installed, now you want to config the application.

1. Download the config the files from GitHub

```bash
git clone https://github.com/rafay99-epic/Alacritty-Terminal-file.git
```

1. Now open your file manager, Once opened then press 'Ctrl + h' to show all of the hidden files.
2. Once all of the files are visible then find the '.config' files.
3. In that file delete the Alacritty folder.
4. Copy the Alacritty folder from the GitHub pages and place the folder in the config file.


