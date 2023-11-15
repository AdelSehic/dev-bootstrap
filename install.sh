#!/bin/bash

# if [ "$EUID" -ne 0 ]
#     then echo "Please run as root (sudo)"
#     exit
# fi

$to_install
programs=("nvim" "tmux" "awesome" "alacritty" "fish" "htop")
programs_t=("nvim")

install_git() {
    read -p 
}
install_nvim() {
config_dir="$HOME/.config"
nvim_dir="$config_dir/nvim"

if [ -e "$nvim_dir" ]; then
    if [ -L "$nvim_dir" ]; then
        rm $nvim_dir
    else
        echo "nvim directory exists in $config_dir, but it's not a symbolic link."
    fi
else
    echo "nvim directory does not exist in $config_dir"
fi
}
ask_for_insall() {
    read -p "Do you wish to install ${to_install}? [y/N]: " yn
    if [ $yn == "y" ] 
    then
        install_$to_install
    else
        echo "skipping $to_install..."
    fi
}

install_nvim
# command -v git >/dev/null 2>&1 || { echo >&2 "This script, and most programs within it, require git to be installed, please install it and rerun the script. Aborting."; exit 1; }

# echo "Welcome to setup !"
# echo "Note: this script only installs config files, you have to install the programs yourself!"
#
# for i in "${programs_t[@]}"
# do
#   to_install=$i
#   ask_for_insall
# done


