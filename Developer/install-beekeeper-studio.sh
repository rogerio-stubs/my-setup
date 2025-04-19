#!/bin/bash

# Atualiza a lista de pacotes
sudo apt update

# Instala dependências necessárias
sudo apt install -y wget gpg

# Adiciona a chave GPG do repositório do Beekeeper Studio
wget -qO - https://deb.beekeeperstudio.io/beekeeper.key | gpg --dearmor | sudo tee /usr/share/keyrings/beekeeper-archive-keyring.gpg > /dev/null

# Adiciona o repositório do Beekeeper Studio
echo "deb [signed-by=/usr/share/keyrings/beekeeper-archive-keyring.gpg] https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper.list

# Atualiza os repositórios novamente
sudo apt update

# Instala o Beekeeper Studio
sudo apt install -y beekeeper-studio

echo "Beekeeper Studio instalado com sucesso!"
