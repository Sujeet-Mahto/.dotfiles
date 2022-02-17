#!/data/data/com.termux/files/usr/bin/bash

printf "Script started!\n"

# Install dependencicies
pkg install neovim -y
pkg install python -y
pkg install git -y

if [ ! -d ".config" ]; then
	mkdir ".config"
	printf ".config created in root directory"
fi

ln -s $HOME"/.dotfiles/nvim/" $HOME"/.config/"

printf "Everything has installed succesfully\n"
printf "Run the neovim and use cmd :PackerSync\n"

