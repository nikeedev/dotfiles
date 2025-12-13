#!/bin/bash

echo 'Symbolically linking fish, neovim, sway, waybar and fuzzel configs'
echo fish config 

if [ ! -d "$HOME/.config/fish" ]; then
    mkdir $HOME/.config/fish
fi

ln -sf $HOME/dotfiles/config.fish $HOME/.config/fish/

echo neovim config

ln -sf $HOME/dotfiles/nvim $HOME/.config/nvim

echo sway
if [ ! -d "$HOME/.config/sway" ]; then
    mkdir $HOME/.config/sway
fi

ln -sf $HOME/dotfiles/sway/config $HOME/.config/sway/

echo waybar

ln -sf $HOME/dotfiles/waybar/ $HOME/.config/waybar

echo fuzzel

ln -sf $HOME/dotfiles/fuzzel/ $HOME/.config/fuzzel

echo wallpaper

ln -sf $HOME/dotfiles/wallpaper.jpg $HOME/wallpaper.jpg 

echo done 
