#!/usr/bin/bash
ln -s .vimrc $HOME/.vimrc
ln -s .gvimrc $HOME/.gvimrc
ln -s .gitconfig $HOME/.gitconfig
ln -s .gitignore_global $HOME/.gitignore_global
ln -s .zshrc $HOME/.zshrc
ln -s .bash_profile $HOME/.bash_profile
ln -s .Rprofile $HOME/.Rprofile
mkdir -p $HOME/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
