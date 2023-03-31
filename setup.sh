#!/usr/bin/env bash

for i in tmux xclip gcc;
do

    which $i 2>&1 >/dev/null
    TOOL_IS_AVAILABLE=$?

    if [ $TOOL_IS_AVAILABLE -ne 0 ]; then
        echo "Installing $i"
        sudo apt install -y $i
    fi

done

# install nvim build dependencies
sudo apt-get install ninja-build gettext libtool-bin cmake g++ pkg-config unzip curl
git clone https://github.com/neovim/neovim ~/nvim_source

git clone https://github.com/prashanthsp6498/nvim-config.git ~/.config/nvim

ln -s .tmux.conf ~/.tmux.conf

