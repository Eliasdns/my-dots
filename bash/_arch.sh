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
    # https://wiki.archlinux.org/title/Pacman/Package_signing#Troubleshooting
    # pacman -Sy archlinux-keyring  # blackarch-keyring chaotic-keyring
    # pacman-key --recv-keys keyid; pacman-key --add /path/to/downloaded/keyfile; pacman-key --finger keyid && pacman-key --lsign-key keyid
    # rm -rf /etc/pacman.d/gnupg; pacman-key --init; pacman-key --populate; pacman-key --refresh-keys
    # pacman -Sc  # ; yay -Sc
    # ntpd -qg; hwclock -w
    # gpg --homedir /etc/pacman.d/gnupg --list-keys

    # curl -s https://archlinux.org/mirrorlist/all/https/ | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 5 - > /etc/pacman.d/mirrorlist
    sudo reflector --save /etc/pacman.d/mirrorlist --latest 5 --country Brazil  # --protocol https
    [ $? -eq 0 ] && sudo pacman -Sy --needed --noconfirm archlinux-keyring && yay -Suu --noconfirm && aaremove

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
