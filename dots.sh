#!/bin/bash

if ! command -v git &> /dev/null; then
    echo "Error: Git is not installed. Please install Git and try again."
    exit 1
fi

if [ ! -d .git ]; then
    echo "Error: Not a git repository. Please navigate to a valid git repository."
    exit 1
fi

if [ ! -f "dots.json" ]; then
    echo "Error: dots.json not found. Please create a dots.json file with the list of dotfiles to install."
    exit 1
fi

execute_scripts() {
    jq -r '.scripts[]' dots.json | while IFS= read -r script; do
        sh "$dots_dir/$script"
    done
}

dots_dir=$(pwd)

link() {
    source_file="$1"
    target_dir="$2"
    ln -sfn "$source_file" "$target_dir"
}

install() {
    jq -c '.dotfiles[]' dots.json | while IFS= read -r line; do
        source_file=$(jq -r 'keys[0]' <<< "$line")
        target_dir=$(jq -r '.["'$source_file'"]' <<< "$line")
        link "$dots_dir/$source_file" "$target_dir"
    done
    execute_scripts
}

uninstall() {
    jq -c '.dotfiles[]' dots.json | while IFS= read -r line; do
        target=$(jq -r '.["'$(jq -r 'keys[0]' <<< "$line")'"]' <<< "$line")
        rm -r "$target"
    done
}

if [ "$1" = "install" ]; then
    install
    echo "Dotfiles installed"
elif [ "$1" = "update" ]; then
    git pull
    install
    echo "Dotfiles updated"
elif [ "$1" = "uninstall" ]; then
    uninstall
    echo "Dotfiles uninstalled"
else
    echo "Invalid argument"
    echo "Usage: ./dots.sh [install|update|uninstall]"
    exit 1
fi
