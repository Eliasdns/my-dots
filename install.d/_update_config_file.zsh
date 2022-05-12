#!/bin/zsh

update_config_file () {
    config_file="$1"
    partial_file="$2"

    if [ -w "$config_file" -a -r "$partial_file" ]; then
        if [[ ! $(< "$config_file") = *$(< "$partial_file")* ]]; then
            if cat "$partial_file" >> "$config_file"; then
                echo "[+] $config_file updated based in $partial_file"
            fi
        else
            echo "[*] $config_file already up-to-date based in $partial_file"
        fi
    elif [[ (! -e "$config_file") && -w "$(dirname $config_file)" && -r "$partial_file" ]]; then
        if cat "$partial_file" >> "$config_file"; then
            echo "[+] $config_file created based in $partial_file"
        fi
    else
        echo "[!] Bad permissions or no such file/directory while update: $config_file based in $partial_file"
        return 1
    fi
}

update_config_file_head () {
    config_file="$1"
    partial_file="$2"
    tmp_file=$(mktemp)

    if [ -w "$config_file" -a -r "$partial_file" ]; then
        if [[ ! $(< "$config_file") = *$(< "$partial_file")* ]]; then
            {
                cat "$partial_file" > "${tmp_file}"
                cat "$config_file" >> "${tmp_file}"
                cat "${tmp_file}" > "$config_file"

                rm ${tmp_file}
            } && {
                echo "[+] $config_file updated based in $partial_file"
            }
        else
            echo "[*] $config_file already up-to-date based in $partial_file"
        fi
    elif [[ (! -e "$config_file") && -w "$(dirname $config_file)" && -r "$partial_file" ]]; then
        if cat "$partial_file" > "$config_file"; then
            echo "[+] $config_file created based in $partial_file"
        fi
    else
        echo "[!] Bad permissions or no such file/directory while update: $config_file based in $partial_file"
        return 1
    fi
}

