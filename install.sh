#!/usr/bin/env bash

mkdir -p ~/.config/nvim
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc" > ~/.config/nvim/init.vim

# curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# sh ./installer.sh ~/.config/nvim/bundles

git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundles/repos/github.com/VundleVim.vim

cp vim/.vimrc $HOME/.vimrc
