#!/bin/bash

# Verifica se o gcloud está instalado
if ! command -v gcloud &> /dev/null; then
    echo "Google Cloud SDK não encontrado. Iniciando instalação..."
    
    # Adiciona o repositório do Google Cloud
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    
    # Importa a chave pública do Google Cloud
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    
    # Atualiza a lista de pacotes
    sudo apt-get update
    
    # Instala o Google Cloud SDK
    sudo apt-get install -y google-cloud-sdk
    
    echo "Google Cloud SDK instalado com sucesso!"
else
    echo "Google Cloud SDK já está instalado."
fi
