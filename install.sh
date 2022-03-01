#!/data/data/com.termux/files/usr/bin/bash

printf "Script started!\n"

# Install dependencicies
pkg upgrade
pkg install neovim -y
pkg install python -y
pip install wheel
pkg install nodejs -y

# Packer for neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Lsp
npm i -g pyright
npm i -g vscode-langservers-extracted
#npm install -g @tailwindcss/language-server


if [ ! -d ".config" ]; then
	mkdir ".config"
fi

ln -s $HOME"/.dotfiles/nvim/" $HOME"/.config/"

printf "\nEverything has installed succesfully"
printf "\nRun the neovim and use cmd :PackerSync\n"

