#!/bin/bash

# install 
# wget -O - https://gist.githubusercontent.com/sgnd/8ac5130ec4439985d14d118c77b7b418/raw/c351376fd4d7afbca587f8ed1f2fd57f87e113ce/docker.sh | bash

# install dependencies
# --------------------
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# add docker repository
# ---------------------
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

# update operating system
# -----------------------
sudo apt update -y

# install docker engine
# ---------------------
sudo apt install docker-ce docker-ce-cli containerd.io -y

# run docker without sudo
# -----------------------
sudo usermod -aG docker $(whoami)

# download docker-compose
# -----------------------
sudo curl -L "https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# change permission docker-compose
# --------------------------------
sudo chmod +x /usr/local/bin/docker-compose
