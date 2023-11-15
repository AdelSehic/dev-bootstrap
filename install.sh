#!/bin/bash

# if [ "$EUID" -ne 0 ]
#     then echo "Please run as root (sudo)"
#     exit
# fi


$to_install
repo_dir="$(git rev-parse --show-toplevel)"
backup_dir="$repo_dir/nvim_backup"
config_dir="$HOME/.config"

programs=("nvim" "tmux" "awesome" "alacritty" "fish" "htop")
programs_t=("nvim")

install_nvim() {
config_dir="$HOME/.config"

if [ -e "$config_dir/$to_install" ]; then
    if [ -L "$config_dir/$to_install" ]; then
        # rm "$config_dir/$to_install"
        echo "$to_install exists and is a symlink"
    else
        echo "$to_install directory exists in $config_dir, but it's not a symbolic link."
    fi
else
    echo "$to_install directory does not exist in $config_dir"
fi
}

ask_for_insall() {
    read -rp "Do you wish to install ${to_install}? [y/N]: " yn
    if [ "$yn" == "y" ] 
    then
        "install_$to_install"
    else
        echo "skipping $to_install..."
    fi
}

echo "Welcome to setup !"
echo "Note: this script only installs config files, you have to install the programs yourself!"

for i in "${programs[@]}"
do
  to_install=$i
  ask_for_insall
done


