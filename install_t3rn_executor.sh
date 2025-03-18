#!/bin/bash

# ASCII Banner
echo" ██████╗ ███████╗████████╗ ██████╗ █████╗ ██╗  ██╗███████╗       "
echo"██╔════╝ ██╔════╝╚══██╔══╝██╔════╝██╔══██╗██║ ██╔╝██╔════╝       "
echo"██║  ███╗█████╗     ██║   ██║     ███████║█████╔╝ █████╗         "
echo"██║   ██║██╔══╝     ██║   ██║     ██╔══██║██╔═██╗ ██╔══╝         "
echo"╚██████╔╝███████╗   ██║   ╚██████╗██║  ██║██║  ██╗███████╗       "
echo" ╚═════╝ ╚══════╝   ╚═╝    ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝       "                                                                
echo"██████╗ ██╗███████╗██╗   ██╗ ██████╗ ██╗   ██╗███╗   ██╗ ██████╗ "
echo"██╔══██╗██║██╔════╝╚██╗ ██╔╝██╔═══██╗██║   ██║████╗  ██║██╔════╝ "
echo"██║  ██║██║█████╗   ╚████╔╝ ██║   ██║██║   ██║██╔██╗ ██║██║  ███╗"
echo"██║  ██║██║██╔══╝    ╚██╔╝  ██║   ██║██║   ██║██║╚██╗██║██║   ██║"
echo"██████╔╝██║███████╗   ██║   ╚██████╔╝╚██████╔╝██║ ╚████║╚██████╔╝"
echo"╚═════╝ ╚═╝╚══════╝   ╚═╝    ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ " 
echo "         GETCAKE DIEYOUNGX - t.me/getcakedieyoungx"
echo ""

# Kullanıcıdan Private Key al
read -sp "Your priv_key? " PRIVATE_KEY_LOCAL
echo ""

# t3rn klasörünü oluştur
mkdir -p ~/t3rn && cd ~/t3rn

# En son sürümü çek
TAG=$(curl -s https://api.github.com/repos/t3rn/executor-release/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')

# Executor'u indir
FILE="executor-linux-$TAG.tar.gz"
wget https://github.com/t3rn/executor-release/releases/download/$TAG/$FILE

# Dosyayı çıkar
tar -xzf $FILE
cd executor/executor/bin

# Ortam değişkenlerini ayarla
echo "export ENVIRONMENT=testnet" >> ~/.bashrc
echo "export LOG_LEVEL=debug" >> ~/.bashrc
echo "export LOG_PRETTY=false" >> ~/.bashrc
echo "export EXECUTOR_PROCESS_BIDS_ENABLED=true" >> ~/.bashrc
echo "export EXECUTOR_PROCESS_ORDERS_ENABLED=true" >> ~/.bashrc
echo "export EXECUTOR_PROCESS_CLAIMS_ENABLED=true" >> ~/.bashrc
echo "export EXECUTOR_MAX_L3_GAS_PRICE=100" >> ~/.bashrc
echo "export PRIVATE_KEY_LOCAL=$PRIVATE_KEY_LOCAL" >> ~/.bashrc
echo "export ENABLED_NETWORKS='arbitrum-sepolia,base-sepolia,optimism-sepolia,l2rn'" >> ~/.bashrc
echo "export RPC_ENDPOINTS='{
    \"l2rn\": [\"https://b2n.rpc.caldera.xyz/http\"],
    \"arbt\": [\"https://arbitrum-sepolia.drpc.org\", \"https://sepolia-rollup.arbitrum.io/rpc\"],
    \"bast\": [\"https://base-sepolia-rpc.publicnode.com\", \"https://base-sepolia.drpc.org\"],
    \"opst\": [\"https://sepolia.optimism.io\", \"https://optimism-sepolia.drpc.org\"],
    \"unit\": [\"https://unichain-sepolia.drpc.org\", \"https://sepolia.unichain.org\"]
}'" >> ~/.bashrc
echo "export EXECUTOR_PROCESS_PENDING_ORDERS_FROM_API=true" >> ~/.bashrc

# Değişiklikleri uygula
source ~/.bashrc

# Executor'u başlat
./executor
