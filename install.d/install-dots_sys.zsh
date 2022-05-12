#!/bin/zsh

source "$(dirname $0)/_update_config_file.zsh"

# For Bash
config_file="/etc/bash.bashrc"
partial_file="$(dirname $0)/sys/_bash.bashrc"
update_config_file "$config_file" "$partial_file"

# For ZSH
config_file="/etc/zsh/zshrc"
partial_file="$(dirname $0)/sys/_zshrc"
update_config_file "$config_file" "$partial_file"

# For tmux
config_file="/etc/tmux.conf"
partial_file="$(dirname $0)/sys/_tmux.conf"
update_config_file "$config_file" "$partial_file"

# For git
config_file="/etc/gitconfig"
partial_file="$(dirname $0)/sys/_gitconfig"
update_config_file "$config_file" "$partial_file"

# For Vim
partial_file="$(dirname $0)/sys/_vimrc"
# Is Arch-based distro:
if (cat /etc/*release | grep -q 'arch'); then 
    config_file="/etc/vimrc"
    update_config_file "$config_file" "$partial_file"
# Is Debian-based distro:
elif (cat /etc/*release | grep -q 'debian'); then 
    config_file="/etc/vim/vimrc"
    update_config_file "$config_file" "$partial_file"
fi

