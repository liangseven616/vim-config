#!/usr/bin/env bash

sudo cp ./.vimrc ~/
cp ./.vim ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

source /etc/os-release
case $ID in
debian|ubuntu|devuan)
	echo "Linux : $ID"
	sudo apt install nodejs
	sudo apt install npm 
	sudo apt install snapd
	;;
centos|fedora|rhel)
esac
sudo snap install ccls --classic
sudo npm i -g bash-language-server

