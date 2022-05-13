# --- Load distro-specific ---
if [ -n "$ZSH_VERSION" ]; then
    dir=$(dirname "$0")
else
    dir=$(dirname "${BASH_SOURCE[0]}")
fi

# Arch:
if (cat /etc/*release | grep -q 'arch'); then 
    [ -r "$dir/_arch.sh" ] && source "$dir/_arch.sh"
# Debian:
elif (cat /etc/*release | grep -q 'debian'); then 
    [ -r "$dir/_debian.sh" ] && source "$dir/_debian.sh"
fi

# Is WSL:
# if [ ! -z $(uname -r | grep microsoft) ]; then
if (uname -r | grep -qi 'microsoft'); then 
    [ -r "$dir/_wsl.sh" ] && source "$dir/_wsl.sh"
fi

unset dir


# --- Env Vars ---
#export TERM=xterm-256color  # 'echo $TERM' or 'tput colors' to check
#export COLORTERM=truecolor

export EDITOR="$(which vim)"
#export VISUAL=kate
export LESS="-FRXK --mouse --wheel-lines=3 $LESS"
[ -d $HOME/.local/bin ] && export PATH="$PATH:$HOME/.local/bin"


# --- Aliases ---
# Modificacao de comandos:
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls --color=auto'

# Sudo:
alias _='sudo'
alias sud='sudo -i'
alias sur='sudo -u root zsh'
alias sue='sudo -u \#1000 zsh'

# ls:
alias ls='ls --color=auto'
alias la='ls -a'
alias lsa='ls -lah'
#alias ll='ls --color=auto -lah'
#alias l='ls --color=auto -lah'
# Depends: exa, colorls
# which colorls >&- && alias l='colorls --color=auto --dark --gs -lah'
alias ll='colorls --color=auto --dark --gs --group-directories-first -lah'
# alias l='exa --color=auto --icons --git --group-directories-first -la'
alias l='exa --color=auto --icons --group-directories-first -la'

# Tree:
# Depends: tree
# alias 0tree='tree -I .git -I venv -a'
# alias 2tree='tree -I .git -I venv -a -L 2'
# alias 3tree='tree -I .git -I venv -a -L 3'
# alias 4tree='tree -I .git -I venv -a -L 4'
# alias ctree='tree -I .git -I venv -a -L'
# Depends: exa
alias tree='exa -T'
alias 0tree='tree -I ".git|venv" -a'
alias 2tree='tree -I ".git|venv" -a -L 2'
alias 3tree='tree -I ".git|venv" -a -L 3'
alias 4tree='tree -I ".git|venv" -a -L 4'
alias ctree='tree -I ".git|venv" -a -L'

# Tmux:
# Depends: tmux
#alias tmux_new='tmux a -t default \; new-window || tmux new -s default'
# alias tmux_new='tmux new -A -s default'
alias tmux_new='tmux has-session -t default && tmux new || tmux new -s default'
alias tmux_atualizar='~/.tmux/plugins/tpm/bin/install_plugins; ~/.tmux/plugins/tpm/bin/clean_plugins; ~/.tmux/plugins/tpm/bin/update_plugins all'
#alias tmux_atualizar="${TMUX_PLUGIN_MANAGER_PATH}tpm/bin/install_plugins; ${TMUX_PLUGIN_MANAGER_PATH}tpm/bin/clean_plugins; ${TMUX_PLUGIN_MANAGER_PATH}tpm/bin/update_plugins all"

# pip:
# Depends: pip
alias pip-atualizar='pip list --format=freeze | cut -d= -f1 | xargs -n1 pip install -U'

# Pontos de montagem:
# Depens: whiptail(libnewt)
#alias mounted='cat /proc/mounts | column -t'
#alias mounted='mount | column -t'
alias mounted='whiptail --title "Pontos de montagem" --msgbox "$(findmnt -A)" 0 0'

# Quotas de disco:
# Depends: quota
alias pquota='quotaon -ap | cut -d" " -f"1,4,5,7" | column -t'

# My global IP:
alias myip="curl https://icanhazip.com"
#alias myip="curl https://ipinfo.io/ip; echo"
#alias myip="curl https://ipecho.net/plain; echo"
#alias myip="curl https://ifconfig.me; echo"

# List connections:
# Depends: ss
#alias lconn='sudo netstat -pane'
alias lconn='sudo ss -pane'

# Ping:
alias gping='ping google.com.br'
alias 1ping='ping 1.1.1.1'

# Git:
# Depends: git
alias gitl='git -P log --oneline --graph --decorate --all'

# Pentest:
# Depends: metasploit
alias msfc='sudo service postgresql start && sudo msfdb init; sudo msfdb start; sudo msfd && sudo msfconsole'


# --- Functions ---
# Depends: vipe(moreutils)
ipatch () {
    OLDFILE="$1"; NEWFILE="$2"
    [ -w "$OLDFILE" -a -r "$OLDFILE" -a -r "$NEWFILE" ] || return 1
    diff --color "$OLDFILE" "$NEWFILE" | bat --file-name "$OLDFILE <- $NEWFILE"
    diff -e "$OLDFILE" "$NEWFILE" | vipe | patch -be "$OLDFILE"
    unset OLDFILE; unset NEWFILE
}


# --- Commands ---
# thefuck:
#eval "$(thefuck --alias)"
# NVM:
[ -r /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh


# --- Load Others---
# Depends: find(findutils)
if [ -n "$ZSH_VERSION" ]; then
    dir=$(dirname "$0")/bashrc.d/
else
    dir=$(dirname "${BASH_SOURCE[0]}")/bashrc.d/
fi

if [ -d "$dir" ]; then
    for file in $(find $dir -maxdepth 1 -type f -iname '*.sh'); do
        [ -r "$file" ] && source "$file"
    done
    unset file
fi
unset dir

