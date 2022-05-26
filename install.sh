#!/data/data/com.termux/files/usr/bin/bash

cd $HOME

printf "Upgrading Packages."
apt update && apt upgrade

printf "Installing required packages."
apt install git -y
apt install curl -y
apt install zsh -y
apt install python -y
apt install neovim -y
apt install nodejs -y
apt install tree -y
apt install lua-language-server -y

pip install --upgrade pip
pip install wheel
pip install black

# Lunarvim setup
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

if [[ ! -d ~/.config/lvim ]] then
  mkdir ~/.config/lvim
fi
ln -sf ~/.dotfiles/lvim/config.lua ~/.config/lvim/config.lua

mv .local/bin/lvim ../usr/bin/

# # ZSH setup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -y
# chsh -s zsh
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
git clone https://github.com/adi1090x/termux-style
cd termux-style
./install
./tstyle

ln -sf ~/.dotfiles/motd ~/../usr/etc/motd
printf "\n\nScript complete. Restart terminal.\n"
