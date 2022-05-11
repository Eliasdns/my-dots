#!/bin/zsh

update_config_file () {
    config_file="$1"
    partial_file="$2"

    if [ -w "$config_file" -a -r "$partial_file" ]; then
        if [[ ! $(< "$config_file") = *$(< "$partial_file")* ]]; then
            if cat "$partial_file" >> "$config_file"; then
                echo "[+] $config_file updated."
            fi
        else
            echo "[*] $config_file already up-to-date."
        fi
    elif [ -w "$(dirname $config_file)" -a -r "$partial_file" ]; then
        if cat "$partial_file" >> "$config_file"; then
            echo "[+] $config_file created."
        fi
    else
        echo "[!] Bad permissions or no such file/directory while update: $config_file"
        return 1
    fi
}

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
