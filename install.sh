#!/data/data/com.termux/files/usr/bin/bash

cd $HOME
apt update && apt upgrade

apt install git -y
apt install curl -y
apt install zsh -y
apt install python -y
apt install neovim -y
apt install nodejs -y
apt install tree -y

pip install --upgrade pip
pip install wheel

# Lunarvim setup
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
mv .local/bin/lvim ../usr/bin/

# ZSH setup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -y
# chsh -s zsh
git clone https://github.com/adi1090x/termux-style
cd termux-style
./install
./tstyle


