# 1. Atualize o sistema
sudo apt update
sudo apt upgrade -y

# 2. Instale dependências
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# 3. Adicione a chave GPG oficial do Docker
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# 4. Adicione o repositório do Docker
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 5. Atualize novamente os pacotes
sudo apt update

# 6. Instale o Docker Engine, CLI e containerd
sudo apt install -y docker-ce docker-ce-cli containerd.io

# 7. Habilite e inicie o serviço do Docker
sudo systemctl enable docker
sudo systemctl start docker

# 8. (Opcional) Adicione seu usuário ao grupo docker para usar sem sudo
sudo usermod -aG docker $USER

newgrp docker