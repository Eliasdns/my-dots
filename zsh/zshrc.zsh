# --- Load distro-specific ---
dir=$(dirname "$0")

# Arch:
if (cat /etc/*release | grep -q 'arch'); then 
    [ -r "$dir/_arch.zsh" ] && source "$dir/_arch.zsh"
# Debian:
elif (cat /etc/*release | grep -q 'debian'); then 
    [ -r "$dir/_debian.zsh" ] && source "$dir/_debian.zsh"
fi

# Garuda:
if (cat /etc/*release | grep -q 'garuda'); then 
    [ -r "$dir/_garuda.zsh" ] && source "$dir/_garuda.zsh"
fi

# Is't WSL:
if ! (uname -r | grep -qi 'microsoft'); then 
    [ -r "$dir/_not_wsl.zsh" ] && source "$dir/_not_wsl.zsh"
fi

unset dir


# --- oh-my-zsh ---
# Depends: oh-my-zsh
# To install oh-my-zsh:
#ZSH=/opt/oh-my-zsh sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" #--keep-zshrc

# Path to your oh-my-zsh installation.
#export ZSH="/usr/share/oh-my-zsh/"
#export ZSH="/opt/oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="bira"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins+=(
	# Depends: Alguma Distro
	#debian ubuntu archlinux suse dnf yum 

	# Depends: Algum Programa
	#firewalld ufw fbterm git-prompt docker tmuxinator vim-interaction adb thefuck tmux 
	# django(deprecated)
    systemd git gitfast git-flow tig python pip node npm nvm asdf vscode nmap httpie fzf fasd zsh-interactive-cd 

	# Depends: Outros
	colorize compleat 

	# Pesquisar mais:
	command-not-found zsh-navigation-tools 

	# Depends: Nada
	#systemadmin common-aliases globalias history-substring-search git-escape-magic timer fastfile vi-mode transfer 
    # zsh_reload(deprecated)
	colored-man-pages dircycle dirhistory wd scd encode64 gitignore sprunge urltools web-search frontend-search 
)
# https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins-Overview
# https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins

source $ZSH/oh-my-zsh.sh

# For thefuck:
[ -r /opt/my-dots/zsh/lib/thefuck.plugin.zsh ] && source /opt/my-dots/zsh/lib/thefuck.plugin.zsh
# For transfer:
[ -r /opt/my-dots/zsh/lib/transfer.plugin.zsh ] && source /opt/my-dots/zsh/lib/transfer.plugin.zsh
# For fbterm:
[ -r /opt/my-dots/zsh/lib/fbterm.plugin.zsh ] && source /opt/my-dots/zsh/lib/fbterm.plugin.zsh

# For dircycle:
# You can bind these functions to other key sequences, as long as you know the bindkey sequence. For example, these commands bind to Alt + Shift + Left / Right in xterm-256color:
bindkey '^[[1;4D' insert-cycledleft
bindkey '^[[1;4C' insert-cycledright

# For vi-mode:
#VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
#VI_MODE_SET_CURSOR=true


# --- zplug ---
# To fix zplug (https://github.com/zplug/zplug/issues/419):
#unsetopt rc_expand_param
#export LC_MESSAGE=en_US.UTF-8

# Depends: zplug
# Now in: --- Load distro-specific ---
#source /usr/share/zsh/scripts/zplug/init.zsh
#source /usr/share/zplug/init.zsh

# Plugins:
#--- Theme:
zplug "romkatv/powerlevel10k", as:theme, depth:1
#---
#zplug "rlljbash/zsh-renew-tmux-env"
#--
# zplug "jeffreytse/zsh-vi-mode"
# export ZVM_VI_ESCAPE_BINDKEY='^\'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
		if read -q; then
			echo; zplug install
		fi
fi
zplug clean

# Then, source plugins and add commands to $PATH
zplug load #--verbose


# --- My configs ---
# For McFly:
#[ -r /usr/share/doc/mcfly/mcfly.bash ] && source /usr/share/doc/mcfly/mcfly.bash

# Turn off beeps on autocomplete
#unsetopt LIST_BEEP
# Turn off beeps on error in history
#unsetopt HIST_BEEP
# Turn off all beeps
unsetopt BEEP

setopt autocd extendedglob

#--- KeyBinds:
# Use 'showkey -a' or 'cat -v' to show key codes.

# By default, there is a 0.4 second delay after you hit the <ESC> key and when the mode change is registered. =1 reduce this delay to 0.1 seconds.
export KEYTIMEOUT=3

# Selects keymap 'viins':
bindkey -v

# Delete previous word on Ctrl+Backspace (Ctrl+H on this system)
bindkey '\C-h' backward-kill-word

# Edit the current command line in $EDITOR (like oh-my-zsh keybind on emacs keymap):
#autoload -U edit-command-line
#zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Yank like emacs keymap:
bindkey "^Y" yank
bindkey "^[y" yank-pop

#--- Aliases:
#alias -s txt='vim'

# --- Commands ---
# Depends: zoxide
eval "$(zoxide init zsh)"

# --- Load Others ---
# --- bashrc:
dir=$(dirname "$0")/../bash
[ -r "$dir/bashrc.sh" ] && source "$dir/bashrc.sh"
# unset dir

# --- zshrc.d:
#dir=${0%/*}
dir=$(dirname "$0")/zshrc.d
if [ -d "$dir" ]; then
    for file in $(find $dir -maxdepth 1 -type f -iname '*.zsh'); do
        [ -r "$file" ] && source "$file"
    done
    unset file
fi
unset dir

