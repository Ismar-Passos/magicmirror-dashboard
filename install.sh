#!/bin/bash

set -e

echo "=============================================="
echo " MagicMirror Dashboard Installer"
echo "=============================================="

echo
echo "Atualizando o sistema..."

sudo apt update
sudo apt upgrade -y

echo
echo "Instalando dependências..."

sudo apt install -y git curl wget build-essential

echo
echo "Instalando Node.js..."

bash scripts/install-node.sh

if [ ! -d "$HOME/MagicMirror" ]; then

    echo
    echo "Clonando MagicMirror²..."

    git clone https://github.com/MagicMirrorOrg/MagicMirror.git "$HOME/MagicMirror"

fi

cd "$HOME/MagicMirror"

echo
echo "Instalando dependências do MagicMirror..."

npm install

echo
echo "Executando instalador de módulos..."

bash "$OLDPWD/scripts/install-modules.sh"

echo
echo "=============================================="
echo "Instalação concluída com sucesso!"
echo "=============================================="