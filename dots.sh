#!/bin/sh

if ! command -v git &> /dev/null; then
    echo "Error: Git is not installed. Please install Git and try again."
    exit 1
fi

if [ ! -d .git ]; then
    echo "Error: Not a git repository. Please navigate to a valid git repository."
    exit 1
fi

if [ ! -f "dots.txt" ]; then
    echo "Error: dots.txt not found. Please create a dots.txt file with the list of dotfiles to install."
    exit 1
fi

dots_dir=$(pwd)

link() {
    source_dir="$dots_dir/$1"
    target_dir="$2"
    ln -sfn "$source_dir" "$target_dir"
}

install() {
    while IFS= read -r line; do
        source_file=$(echo "$line" | cut -d' ' -f1)
        target_dir=$(echo "$line" | cut -d' ' -f2)
        link "$source_file" "$target_dir"
    done < dots.txt
}

update() {
    git pull
    install
}

uninstall() {
    while IFS= read -r line; do
        target=$(echo "$line" | cut -d' ' -f2)
        rm -r "$target"
    done < dots.txt
}

if [ "$1" = "install" ]; then
    install
    echo "Dotfiles installed"
elif [ "$1" = "update" ]; then
    update
    echo "Dotfiles updated"
elif [ "$1" = "uninstall" ]; then
    uninstall
    echo "Dotfiles uninstalled"
else
    echo "Invalid argument"
    echo "Usage: ./dots.sh [install|update|uninstall]"
    exit 1
fi
