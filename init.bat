@echo off
mklink %USERPROFILE%\_vimrc .vimrc
mklink %USERPROFILE%\_gvimrc .gvimrc
mklink %USERPROFILE%\.gitconfig .gitconfig
mklink %USERPROFILE%\.gitignore_global .gitignore_global
mklink %USERPROFILE%\.Rprofile .Rprofile
mkdir %USERPROFILE%\vimfiles\bundle
git clone https://github.com/Shougo/neobundle.vim %USERPROFILE%\vimfiles\bundle\neobundle.vim
