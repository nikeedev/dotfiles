#!/bin/bash

echo 'Symbolically linking fish, neovim, sway and i3status configs'
echo fish config 
ln -sf $HOME/dotfiles/config.fish $HOME/.config/fish/
echo neovim config
ln -sf $HOME/dotfiles/nvim $HOME/.config/nvim

echo sway
if [ ! -d "$HOME/.config/sway" ]; then
    mkdir $HOME/.config/sway
fi

ln -sf $HOME/dotfiles/sway/config $HOME/.config/sway/

echo i3status
if [ ! -d "$HOME/.config/i3status" ]; then
    mkdir $HOME/.config/i3status
fi
ln -sf $HOME/dotfiles/i3status/config $HOME/.config/i3status/
 
echo done 
