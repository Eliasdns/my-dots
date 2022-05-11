if [[ -z $commands[thefuck] ]]; then
    echo 'thefuck is not installed, you should "pip install thefuck" or "brew install thefuck" first.'
    echo 'See https://github.com/nvbn/thefuck#installation'
    return 1
fi

# Register alias
# eval "$(thefuck --alias)"
# eval "$(thefuck --alias --enable-experimental-instant-mode)"
[[ ! -a $ZSH_CACHE_DIR/thefuck ]] && thefuck --alias > $ZSH_CACHE_DIR/thefuck
source $ZSH_CACHE_DIR/thefuck

fuck-command-line() {
    # local FUCK="$(THEFUCK_REQUIRE_CONFIRMATION=0 thefuck $(fc -ln -1 | tail -n 1) 2> /dev/null)"
    local FUCK="$(THEFUCK_REQUIRE_CONFIRMATION=0 PATH=$(echo \"$PATH\" | sed 's/\/mnt\/[a-z]\/[^:]*//g; s/:\{2,\}/:/g') thefuck $(fc -ln -1 | tail -n 1) 2> /dev/null)"
    [[ -z $FUCK ]] && echo -n -e "\a" && return
    BUFFER=$FUCK
    zle end-of-line
}
zle -N fuck-command-line
# Defined shortcut keys: [Esc] [Esc]
bindkey -M emacs '\e\e' fuck-command-line
bindkey -M vicmd '\e\e' fuck-command-line
bindkey -M viins '\e\e' fuck-command-line

fuck-command-options() {
    # PATH="$(echo \"$PATH\" | sed 's/\/mnt\/[a-z]\/[^:]*//g; s/:\{2,\}/:/g')" fuck
    BUFFER="PATH=\"\$(echo \$PATH | sed 's/\\/mnt\\/[a-z]\\/[^:]*//g; s/:\\{2,\\}/:/g')\" fuck"
    zle accept-line
}
zle -N fuck-command-options
# Defined shortcut keys: [Esc]'
bindkey -M emacs "\e'" fuck-command-options
bindkey -M vicmd "\e'" fuck-command-options
bindkey -M viins "\e'" fuck-command-options

# Defined shortcut keys: [Esc]'
# bindkey -s "\e'" "PATH=\"\$\(echo \$PATH | sed 's/\\\\/mnt\\\\/[a-z]\\\\/[\\^:]*//g; s/:\\\\{2,\\\\}/:/g'\)\" fuck\n"

