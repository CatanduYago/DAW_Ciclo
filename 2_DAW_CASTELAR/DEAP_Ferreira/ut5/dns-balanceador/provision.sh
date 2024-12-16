apt-get update && apt-get install -y curl

sudo -u vagrant docker --version
if [[ ! $? -eq 0 ]]; then
    sudo -u vagrant curl -fsSL https://get.docker.com -o install-docker.sh
    sh install-docker.sh

    groupadd docker
    usermod -aG docker vagrant
fi

sudo -u vagrant docker --version

ip a | grep "inet "

cd /vagrant
docker compose up -d
