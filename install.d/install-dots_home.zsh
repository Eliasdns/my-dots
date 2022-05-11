#!/bin/zsh

# TODO: Se nao tiver "normal", copia e altera as permissoes e criador
# TODO: Se ja tiver "normal", substitui conteudo
# TODO: Se nao tiver "_parcial", insere no final
# TODO: Se nao tiver "_tail", insere no final
# TODO: Se nao tiver "_head", insere no inicio
# TODO: Se --verbose, mostra a diferencia antes de alterar, podendo cancelar

# TODO: _p10k_zshrc_head.zsh e _p10k_zshrc_tail.zsh
cp -i "$(dirname $0)/home/.p10k.zsh" ~
