#!/bin/bash

echo 'Symbolically linking fish and neovim configs'
ln -sf $HOME/dotfiles/config.fish $HOME/.config/fish/
ln -sf $HOME/dotfiles/nvim $HOME/.config/nvim
echo done 
