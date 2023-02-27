#!/bin/bash
# t-mux
mv ~/.tmux.conf ~/.tmux.conf.bak
cd tmux
ln -s .tmux.conf ~/.tmux.conf

# alacritty

# zsh
mv ~/.zshrc ~/.zshrc.bak
cd zsh
ln -s .zshrc ~/.zshrc

# neovim
mv ~/.config/nvim ~/.config/nvim.bak
ln -s nvim ~/.config/nvim
