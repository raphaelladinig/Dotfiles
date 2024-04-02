#!/bin/sh

cursor_url="https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.6/Bibata-Modern-Ice.tar.xz"
cursor_name="Bibata-Modern-Ice"
cursor_path="$HOME/.local/share/icons/$cursor_name"

if [ -d "$cursor_path" ]; then
    echo "Cursor '$cursor_name' is already installed."
else
    echo "Downloading cursor '$cursor_name'..."
    mkdir -p ./cursors/$cursor_name
    if curl -fsSL -o "$cursor_name.tar.xz" "$cursor_url"; then
        tar -xf "$cursor_name.tar.xz" -C "./cursors/"
        rm "$cursor_name.tar.xz"
        mkdir -p "$HOME/.local/share/icons/"
        ln -sfn "$(pwd)/cursors/$cursor_name" "$cursor_path"
        echo "Cursor '$cursor_name' downloaded successfully."
    else
        echo "Failed to download cursor '$cursor_name'."
    fi
fi

