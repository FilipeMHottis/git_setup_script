# Git Auto Setup Script (Debian Edition)

Este repositório contém um script em Bash que automatiza a instalação e configuração do Git em sistemas baseados em Debian, como Ubuntu e Linux Mint.

## ✅ O que o script faz:

- Instala o Git via `apt`
- Configura nome e email globais do Git
- Define o editor padrão como `nano`
- Gera uma chave SSH (caso ainda não exista)
- Exibe a chave pública para facilitar o cadastro no GitHub

## 🧰 Requisitos

- Sistema baseado em Debian (Debian, Ubuntu, Mint, Pop!_OS, etc.)
- Terminal com acesso `sudo`

## 🚀 Como usar

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/git-auto-setup.git
   cd git-auto-setup
   ```

2. Torne o script executável:

   ```bash
    chmod +x setup_git.sh
   ```

3. Edite o script com seu nome e email:

   ```bash
    nano setup_git.sh
   ```

4. Execute o script:

   ```bash
    ./setup_git.sh
   ```

## 🛠️ Personalização
Abra o script e edite as variáveis:

   ```bash
    GIT_NAME="Seu Nome"
    GIT_EMAIL="seu@email.com"
   ```

### 🔐 Sobre a chave SSH

O script cria uma chave SSH (ed25519) apenas se não existir.

Ao final, ele imprime sua chave pública no terminal para que você possa adicioná-la ao GitHub (em Settings > SSH and GPG keys).
