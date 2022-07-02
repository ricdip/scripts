#!/bin/sh

# installing vim-plug in nvim
mkdir -p $HOME/.config/nvim/autoload
mkdir -p $HOME/.config/nvim/plugged
cd $HOME/.config/nvim/autoload

# downloading vim-plug
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
