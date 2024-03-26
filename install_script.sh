#!/bin/sh

ln -s ./foot/ ~/.config/foot
ln -s ./hypr/ ~/.config/hypr
ln -s ./lf ~/.config/lf 
ln -s ./mako ~/.config/mako
ln -s ./nvim ~/.config/nvim/
ln -s ./waybar/ ~/.config/waybar
ln -s ./.tmux.conf ~/.tmux.conf
ln -s ./.zprofile ~/.zprofile
ln -s ./.zshenv ~/.zshenv
ln -s ./.zshrc ~/.zshrc

echo "Dotfiles installation complete!"

echo "userChrome.css must be manually copied to the Firefox profile directory."
