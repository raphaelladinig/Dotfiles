#!/bin/sh

font_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaCode.zip"
font_name="CaskaydiaCove"

font_path="$HOME/.local/share/fonts/$font_name"

if [ -d "$font_path" ]; then
    echo "Font '$font_name' is already installed."
else
    echo "Downloading font '$font_name'..."
    if curl -fsSL -o "$font_path.zip" "$font_url"; then
        unzip -q "$font_path.zip" -d "$font_path"
        rm "$font_path.zip"
        echo "Font '$font_name' downloaded successfully."
    else
        echo "Failed to download font '$font_name'."
    fi
fi

