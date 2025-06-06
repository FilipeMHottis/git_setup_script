#!/bin/bash

# ===============================================
# Script: setup_git.sh
# Objetivo: Instalar e configurar o Git automaticamente (Debian)
# Autor: Filipe Marques Hottis
# ===============================================

# --------- CONFIGURAÇÕES INICIAIS (EDITE AQUI) ---------

GIT_NAME="Filipe Marques Hottis"
GIT_EMAIL="seuemail@exemplo.com"
EDITOR_PREFERIDO="nano"

# Ative esta linha se usar GPG para assinar commits:
# GPG_KEY_ID="XXXXXXXX"  # Coloque o ID da sua chave GPG

# Ative esta linha se for assinar com SSH:
# export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519"

# --------------------------------------------------------

print_msg() {
  echo
  echo "========================================"
  echo "$1"
  echo "========================================"
}

# 1. Atualização e instalação do Git
print_msg "Atualizando pacotes e instalando Git..."
sudo apt update -y
sudo apt install -y git

# 2. Configuração básica
print_msg "Configurando Git com nome e email..."
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global core.editor "$EDITOR_PREFERIDO"

# 3. Configurações úteis e recomendadas
print_msg "Aplicando configurações úteis adicionais..."
git config --global init.defaultBranch main              # Usa "main" como padrão
git config --global pull.rebase true                     # Rebase ao fazer pull
git config --global color.ui auto                        # Ativa cores no terminal
git config --global core.autocrlf input                  # Converte CRLF ao salvar (bom para Linux)
git config --global core.excludesfile ~/.gitignore_global  # Ignorar global

# 4. Cache de credenciais HTTPS por 1 hora (opcional)
git config --global credential.helper 'cache --timeout=3600'

# 5. Alias úteis
print_msg "Criando aliases para comandos Git..."
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.cm commit
git config --global alias.last 'log -1 HEAD'
git config --global alias.hist 'log --oneline --graph --decorate --all'

# 6. Assinatura automática de commits (opcional)
# Para GPG:
# git config --global user.signingkey "$GPG_KEY_ID"
# git config --global commit.gpgsign true

# Para SSH (com GitHub via SSH):
# git config --global gpg.format ssh
# git config --global user.signingkey ~/.ssh/id_ed25519.pub
# git config --global commit.gpgsign true

# 7. Geração de chave SSH (se não existir)
SSH_KEY="$HOME/.ssh/id_ed25519"
if [ -f "$SSH_KEY" ]; then
  print_msg "Chave SSH já existe."
else
  print_msg "Gerando nova chave SSH..."
  ssh-keygen -t ed25519 -C "$GIT_EMAIL" -f "$SSH_KEY" -N ""
fi

# 8. Mostrar chave SSH pública
print_msg "Aqui está sua chave pública SSH:"
cat "$SSH_KEY.pub"
echo
echo "Adicione no GitHub: https://github.com/settings/keys"

# 9. Testar conexão SSH (opcional)
read -p "Deseja testar a conexão SSH com o GitHub agora? (s/n): " resp
if [[ "$resp" =~ ^[sS]$ ]]; then
  ssh -T git@github.com
fi

print_msg "Configuração completa! Seu Git está pronto para uso 🚀"
