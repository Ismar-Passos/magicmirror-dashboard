#!/bin/bash

set -e

echo "=================================="
echo " Instalando Node.js LTS"
echo "=================================="

if command -v node >/dev/null 2>&1; then
    echo "Node.js já instalado:"
    node -v
    npm -v
    exit 0
fi

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

echo "Node instalado:"
node -v
npm -v