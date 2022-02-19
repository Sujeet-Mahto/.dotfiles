#!/data/data/com.termux/files/usr/bin/bash

printf "Script started!\n"

# Install dependencicies
pkg install neovim -y
pkg install python -y
pkg install nodejs -y
pkg install git -y

# Packer for neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Lsp
npm i -g pyright
npm i -g vscode-langservers-extracted
#npm install -g @tailwindcss/language-server


if [ ! -d ".config" ]; then
	mkdir ".config"
	printf ".config created in root directory"
fi

ln -s $HOME"/.dotfiles/nvim/" $HOME"/.config/"

printf "Everything has installed succesfully\n"
printf "Run the neovim and use cmd :PackerSync\n"

