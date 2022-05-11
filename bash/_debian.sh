# --- Aliases ---
# Gestao de pacotes/softwares:
alias aupdate='sudo apt update'
alias aatualizar="sudo vim +PlugUpgrade +PlugClean +PlugUpdate +qall; sudo -u $USER vim +PlugUpgrade +PlugClean +PlugUpdate +qall; sudo apt update && sudo apt full-upgrade -y --allow-downgrades && sudo apt autoremove -y; sudo apt install -f -y; sudo zsh -ic 'omz update; zplug update'; sudo -u $USER zsh -ic 'zplug update'"
alias aatualizavel='sudo apt update && sudo apt list --upgradable -a'
alias asearch='apt search --names-only'
alias ainstall='sudo apt install -y'
alias ainstalld='sudo apt install -f'
alias aaremove='sudo apt autoremove' 

alias bat='batcat'
