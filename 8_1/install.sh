sudo dnf install -y gcc-c++ make git docker
sudo dnf groupinstall -y "Development Tools"
sudo usermod -aG docker ec2-user

newgrp docker


sudo systemctl enable docker
sudo systemctl start docker
echo 'export DOCKER_BUILDKIT=1' >> ~/.bash_profile
source ~/.bash_profile

git clone https://github.com/sinanartun/awsbc11.git

cd awsbc11/8_1sudo dnf install python3.11 python3.11-pip -y
python3.11 -m venv venv
source venv/bin/activate
pip install -r twitter_fastapi/requirements.txt

sudo yum install certbot
sudo certbot certonly --standalone -d sentiment.github.rocks

sudo getent group certbot
sudo groupadd certbot
sudo usermod -a -G certbot ec2-user
groups
ls -l /etc/letsencrypt/live/sentiment.github.rocks/


# CMD-SHELL, curl -kf https://localhost:8000/ || exit 1