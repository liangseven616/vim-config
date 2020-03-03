#!/usr/bin/env bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo cp -r .vimrc ~/.vimrc
sudo rm -rf ~/.vim
sudo cp -r .vim ~/.vim
sudo curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

if [ ! -d "./ctags" ]; then
  git clone https://github.com/universal-ctags/ctags.git
  cd ctags
  ./autogen.sh
  ./configure --prefix=/opt/software/universal-ctags 
  make -j4
  sudo make install
  cd ..
fi
if [ ! -d "./gtags" ]; then
  wget http://tamacom.com/global/global-6.6.4.tar.gz
  tar -xf global-6.6.4.tar.gz
  cd global-6.6.4
  ./configure --with-sqlite3   #gtags可以使用Sqlite3作为数据库，在编译时需要加这个参数
  make -j4     #四线程并行编译
  make check
  sudo make install
  sudo make install check
  cd ..
fi

source /etc/os-release
case $ID in
debian|ubuntu|devuan)
	echo "Linux : $ID"
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
