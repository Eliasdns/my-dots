# --- Aliases ---
# Gestao de pacotes/softwares:
alias aaremove='sudo pacman -Qdtq | sudo pacman -Rns - --noconfirm'
alias aorfaos='pacman -Qdt'
#alias aatualizar="sudo vim +PlugUpgrade +PlugClean +PlugUpdate +qall; sudo -u $USER vim +PlugUpgrade +PlugClean +PlugUpdate +qall; sudo -u $USER yay -Suuy --noconfirm && aremove; sudo zsh -ic 'zplug update'; sudo -u $USER zsh -ic 'zplug update'; sudo zsh -ic tmux_atualizar; sudo -u $USER zsh -ic tmux_atualizar"  # Now in: --- Functions ---
alias aatualizavel='yay -Suuyp --print-format "%r/%n %v %sB"'
alias abmodificados="sudo pacman -Qii | awk '/^MODIFIED/ {print $2}'"
alias asearch="pacman -Sl | sed 's/\S* //' | egrep"


# --- Functions ---
aatualizar() {
    sudo pacman -Sy --noconfirm archlinux-keyring && yay -Suu --noconfirm && aremove

    sudo snap refresh

    if [ -n "$(which asdf)" ]; then
        # asdf update; sudo asdf update
        asdf plugin-update --all; sudo asdf plugin-update --all
    fi

    sudo vim +PlugUpgrade +PlugClean +PlugUpdate +qa
    sudo -u $USER vim +PlugUpgrade +PlugClean +PlugUpdate +qa

    sudo zsh -ic 'zplug update'
    sudo -u $USER zsh -ic 'zplug update'

    sudo zsh -ic tmux_atualizar
    zsh -ic tmux_atualizar
}

alfiles () {
    pacman -Qlq $1 | grep -v '/$' | xargs -r du -h | sort -h
}

aldependsby () {
    LC_ALL=C pacman -Qi $@ | grep 'Required By' | sed 's/Required By\s*:/>>/'
}
