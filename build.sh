#!/usr/bin/env bash

sudo cp -r .vimrc ~/
sudo rm -rf ~/.vim
sudo cp -r .vim ~/.vim
sudo url --compressed -o- -L https://yarnpkg.com/install.sh | bash

mkdir ~/vim-config
cd ~/vim_config
mkdir ctags && cd ctags
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure --prefix=/opt/software/universal-ctags  # 我的安装路径。你按自己的情况调整。
make -j4
sudo make install

cd .. && mkdir gtags && cd gtags
wget http://tamacom.com/global/global-6.6.4.tar.gz
tar -xf global-6.6.4.tar.gz
cd global-6.6.4
./configure --with-sqlite3   #gtags可以使用Sqlite3作为数据库，在编译时需要加这个参数
make -j4     #四线程并行编译
make check
sudo make install
sudo make install check

source /etc/os-release
case $ID in
debian|ubuntu|devuan)
	echo "Linux : $ID"
	sudo apt install nodejs
	sudo apt install npm 
	sudo apt install snapd
	sudo apt install yarn
	;;
centos|fedora|rhel)
esac
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
sudo snap install ccls --classic
sudo npm i -g bash-language-server

sudo vim -c "PlugInstall" -c "q" -c "q"
