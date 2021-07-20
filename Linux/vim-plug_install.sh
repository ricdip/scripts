#!/bin/sh

# installing vim-plug in nvim
mkdir -p .config/nvim/autoload
mkdir -p .config/nvim/plugged
cd .config/nvim/autoload

# downloading vim-plug
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
