if [[ $TERM == "xterm-kitty" || -n $KONSOLE_VERSION ]]; then
    test -x "$(which fastfetch)" && fastfetch --load-config dr460nized
elif [[ -n $ALACRITTY_SOCKET || -n $ALACRITTY_LOG || -n $ALACRITTY_WINDOW_ID ]]; then
    test -x "$(which fastfetch)" && fastfetch --load-config paleofetch
fi

