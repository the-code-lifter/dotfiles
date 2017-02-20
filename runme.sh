#!/bin/bash

echo "Updating packages"
sudo apt-get update
echo "Install complete"

echo "Moving old files to a new folder called old"
if [ -d $HOME/old ]; then echo 'Exists'; else mkdir $HOME/old; fi
if [ -f $HOME/.gitconfig ]; then mv $HOME/.gitconfig $HOME/old; fi
if [ -f $HOME/.gitignore_global ]; then mv $HOME/.gitignore_global $HOME/old; fi
if [ -f $HOME/.vimrc ]; then mv $HOME/.vimrc $HOME/old; fi
sudo echo "Move ~Complete"

echo "Symlink - Start"
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.gitignore_global $HOME/.gitignore_global
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
echo "Symlink - Complete"

echo "Vim Setup - Start"
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
echo "Vim Setup - Complete"
