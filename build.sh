#!/usr/bin/env bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo cp -r .vimrc ~/.vimrc
sudo rm -rf ~/.vim
sudo cp -r .vim ~/.vim

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
sudo dpkg -i ripgrep_0.10.0_amd64.deb

source /etc/os-release
case $ID in
debian|ubuntu|devuan)
	echo "Linux : $ID"
	sudo apt install ctags global
	sudo apt install nodejs
	sudo apt install npm 
	sudo apt install yarn
	sudo apt install clang-tools-8
	;;
centos|fedora|rhel)
esac
sudo npm i -g bash-language-server
sudo vim -c "CocInstall coc-clangd" -c "q" -c "q"
sudo vim -c "PlugInstall" -c "q" -c "q"
