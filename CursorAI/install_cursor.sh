#!/bin/bash

# Atualizar o sistema
echo "Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

# Instalar dependências necessárias
echo "Instalando dependências..."
sudo apt install -y wget curl git libgtk-3-0 libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 libxkbcommon0 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 libgbm1 libasound2 libpango-1.0-0 libpangocairo-1.0-0

# Criar diretório para o Cursor
echo "Criando diretório para o Cursor..."
mkdir -p ~/.cursor

# Baixar a última versão do Cursor
echo "Baixando a última versão do Cursor..."
LATEST_VERSION=$(curl -s https://api.github.com/repos/getcursor/cursor/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
DOWNLOAD_URL="https://github.com/getcursor/cursor/releases/download/${LATEST_VERSION}/Cursor-${LATEST_VERSION}.AppImage"

wget -O ~/.cursor/Cursor.AppImage "$DOWNLOAD_URL"

# Tornar o arquivo executável
echo "Tornando o arquivo executável..."
chmod +x ~/.cursor/Cursor.AppImage

# Criar atalho no desktop
echo "Criando atalho no desktop..."
cat > ~/Desktop/Cursor.desktop << EOL
[Desktop Entry]
Name=Cursor
Comment=AI-Powered Code Editor
Exec=~/.cursor/Cursor.AppImage --no-sandbox
Icon=~/.cursor/icon.png
Terminal=false
Type=Application
Categories=Development;IDE;
EOL

# Tornar o atalho executável
chmod +x ~/Desktop/Cursor.desktop

# Criar script de inicialização
echo "Criando script de inicialização..."
cat > ~/.cursor/start-cursor.sh << EOL
#!/bin/bash
~/.cursor/Cursor.AppImage --no-sandbox
EOL

chmod +x ~/.cursor/start-cursor.sh

# Adicionar ao PATH
echo "Adicionando ao PATH..."
echo 'export PATH=$PATH:~/.cursor' >> ~/.bashrc
source ~/.bashrc

echo "Instalação concluída!"
echo "Você pode iniciar o Cursor de duas maneiras:"
echo "1. Clicando no ícone no desktop"
echo "2. Executando o comando: ~/.cursor/start-cursor.sh"