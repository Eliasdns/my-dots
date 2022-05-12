#!/bin/zsh

# TODO: Se nao tiver "normal", copia e altera as permissoes e criador
# TODO: Se ja tiver "normal", substitui conteudo
# TODO: Se nao tiver "_parcial", insere no final
# TODO: Se nao tiver "_tail", insere no final
# TODO: Se nao tiver "_head", insere no inicio
# TODO: Se --verbose, mostra a diferencia antes de alterar, podendo cancelar

source "$(dirname $0)/_update_config_file.zsh"

# --- powerlevel10k:
cp -i "$(dirname $0)/home/.p10k.zsh" ~

config_file="$HOME/.zshrc"

partial_file="$(dirname $0)/home/_p10k_zshrc_tail.zsh"
update_config_file "$config_file" "$partial_file"

partial_file="$(dirname $0)/home/_p10k_zshrc_head.zsh"
update_config_file_head "$config_file" "$partial_file"

