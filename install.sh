#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PROJECT_NAME="MagicMirror Dashboard"
MM_DIR="$HOME/MagicMirror"

echo "=============================================="
echo "       $PROJECT_NAME Installer"
echo "=============================================="

# Verifica Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "Este instalador é destinado ao Raspberry Pi OS (Linux)."
    exit 1
fi

echo
echo "[1/8] Atualizando o sistema..."

sudo apt update
sudo apt upgrade -y

echo
echo "[2/8] Instalando dependências..."

sudo apt install -y \
git \
curl \
wget \
unzip \
build-essential \
python3 \
python3-pip \
ca-certificates

echo
echo "[3/8] Verificando Node.js..."

if command -v node >/dev/null 2>&1; then
    echo "Node encontrado: $(node -v)"
else
    echo "Instalando Node.js LTS..."

    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

    sudo apt install -y nodejs

    echo "Node instalado: $(node -v)"
fi

echo
echo "NPM: $(npm -v)"

echo
echo "[4/8] Instalando MagicMirror²..."

if [ ! -d "$MM_DIR" ]; then

    git clone https://github.com/MagicMirrorOrg/MagicMirror.git "$MM_DIR"

else

    echo "MagicMirror já existe."

fi

cd "$MM_DIR"

echo
echo "[5/8] Instalando dependências do MagicMirror..."

npm install

echo
echo "[6/8] Criando backup da configuração..."

mkdir -p "$HOME/magicmirror-backup"

if [ -f "$MM_DIR/config/config.js" ]; then

    cp "$MM_DIR/config/config.js" \
    "$HOME/magicmirror-backup/config.js.bak"

fi

echo
echo "[7/8] Aplicando configuração personalizada..."

cp "$SCRIPT_DIR/config/config.js" \
   "$MM_DIR/config/config.js"

echo "Configuração instalada com sucesso."

echo
echo "[8/8] Aplicando tema personalizado..."

cp "$SCRIPT_DIR/css/custom.css" \
   "$MM_DIR/css/custom.css"

echo "Tema personalizado instalado com sucesso."

echo
echo "================================================"
echo " Instalação básica concluída!"
echo "================================================"

echo
echo "Concluído:"
echo "  ✓ MagicMirror instalado"
echo "  ✓ Dependências instaladas"
echo "  ✓ Backup da configuração criado"
echo "  ✓ config.js personalizado instalado"
echo "  ✓ custom.css personalizado instalado"

echo
echo "Próximas etapas:"
echo "  ○ Instalar módulos adicionais"
echo "  ○ Configurar PM2"