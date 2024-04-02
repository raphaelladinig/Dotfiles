#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}Error: Git is not installed. Please install Git and try again.${NC}"
    exit 1
fi

echo -e "${GREEN}Git is installed.${NC}"

# Check if current directory is a Git repository
if [ ! -d .git ]; then
    echo -e "${RED}Error: Not a git repository. Please navigate to a valid git repository.${NC}"
    exit 1
fi

echo -e "${GREEN}Current directory is a Git repository.${NC}"

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo -e "${RED}Error: jq is not installed. Please install jq and try again.${NC}"
    exit 1
fi

echo -e "${GREEN}jq is installed.${NC}"

# Check if dots.json exists
if [ ! -f "dots.json" ]; then
    echo -e "${RED}Error: dots.json not found. Please create a dots.json file with the list of dotfiles to install.${NC}"
    exit 1
fi

echo -e "${GREEN}dots.json found.${NC}"

# Execute scripts based on event
executeScripts() {
    local event=$1
    jq -r ".scripts.$event[]" dots.json | while IFS= read -r script; do
        echo -e "${GREEN}Executing script: $script.${NC}"
        sh "$(pwd)/$script"
    done
}

# Install dependencies specified in dots.json
installDependencies() {
    echo -e "${GREEN}Installing dependencies.${NC}"
    jq -r '.dependencies | to_entries[] | "\(.value.url) \(.value.install_path) \(.key)"' dots.json | while read -r url installPath title; do
        echo -e "${GREEN}Installing dependency: $title.${NC}"
        mkdir -p "$(eval echo "$installPath")"
        if [ -e "$(eval echo "$installPath/$title")" ]; then
            rm -rf "$(eval echo "$installPath/$title")"
        fi
        fileExtension="$(basename "$url" | awk -F . '{print $NF}')"
        case "$fileExtension" in
            "xz")
                curl -L "$url" -o "/tmp/$title.tar.xz" || {
                    echo -e "${RED}Error: Failed to download $title.${NC}"
                    exit 1
                }
                tar -xf "/tmp/$title.tar.xz" -C "$(eval echo "$installPath")"
                rm "/tmp/$title.tar.xz"
                ;;
            "zip")
                curl -L "$url" -o "/tmp/$title.zip" || {
                    echo -e "${RED}Error: Failed to download $title.${NC}"
                    exit 1
                }
                unzip -q "/tmp/$title.zip" -d "$(eval echo "$installPath/$title")"
                rm "/tmp/$title.zip"
                ;;
            *)
                echo -e "${YELLOW}Unsupported file extension: $fileExtension${NC}"
                ;;
        esac
    done
    echo -e "${GREEN}Dependencies installed.${NC}"
}

# Create symbolic links
link() {
    local sourceFile="$1"
    local targetDir="$2"
    ln -sfn "$sourceFile" "$targetDir"
}

# Update symbolic links
updateLinks() {
    echo -e "${GREEN}Updating symbolic links.${NC}"
    jq -c '.links[]' dots.json | while IFS= read -r line; do
        sourceFile=$(jq -r 'keys[0]' <<< "$line")
        targetDir=$(jq -r '.["'$sourceFile'"]' <<< "$line")
        link "$(pwd)/$sourceFile" "$(eval echo "$targetDir")"
    done
    echo -e "${GREEN}Symbolic links updated.${NC}"
}

# Install dotfiles
install() {
    echo -e "${GREEN}Installing dotfiles.${NC}"
    installDependencies
    executeScripts "install"
    updateLinks
    echo -e "${GREEN}Dotfiles installed.${NC}"
}

# Update dotfiles
update() {
    echo -e "${GREEN}Updating dotfiles.${NC}"
    git pull
    installDependencies
    executeScripts "update"
    updateLinks
    echo -e "${GREEN}Dotfiles updated.${NC}"
}

# Uninstall dotfiles
uninstall() {
    echo -e "${GREEN}Uninstalling dotfiles.${NC}"
    jq -c '.dotfiles[]' dots.json | while IFS= read -r line; do
        target=$(jq -r '.["'$(jq -r 'keys[0]' <<< "$line")'"]' <<< "$line")
        rm -r "$target"
    done
    executeScripts "uninstall"
    echo -e "${GREEN}Dotfiles uninstalled.${NC}"
}

# Handle script arguments
case "$1" in
    "install")
        install
        ;;
    "update")
        update
        ;;
    "uninstall")
        uninstall
        ;;
    *)
        echo -e "${RED}Invalid argument${NC}"
        echo -e "${YELLOW}Usage: ./dots.sh [install|update|uninstall]${NC}"
        exit 1
        ;;
esac

