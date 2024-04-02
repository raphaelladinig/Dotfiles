#!/bin/sh

font_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaCode.zip"
font_name="CaskaydiaCove"
font_path="$HOME/.local/share/fonts/$font_name"

if [ -d "$font_path" ]; then
    echo "Font '$font_name' is already installed."
else
    echo "Downloading font '$font_name'..."
    mkdir -p ./fonts
    if curl -fsSL -o "$font_name.zip" "$font_url"; then
        unzip -q "$font_name.zip" -d "./fonts/$font_name"
        rm "$font_name.zip"
        mkdir -p "$HOME/.local/share/fonts/"
        ln -sfn "$(pwd)/fonts/$font_name" "$font_path"
        echo "Font '$font_name' downloaded successfully."
    else
        echo "Failed to download font '$font_name'."
    fi
fi

