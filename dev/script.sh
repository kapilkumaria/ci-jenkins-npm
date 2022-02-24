#!/bin/bash
sudo su
apt update -y
apt install awscli -y
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt update -y
apt install openjdk-8-jdk -y
apt-cache policy docker-ce
apt install docker.io -y
service docker start
usermod -a -G docker ubuntu
chmod 666 /var/run/docker.sock
chkconfig docker on
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 931058976119.dkr.ecr.us-east-1.amazonaws.com
docker pull 931058976119.dkr.ecr.us-east-1.amazonaws.com/my-nodeapp:latest
docker run -d -it -p 3000:3000 931058976119.dkr.ecr.us-east-1.amazonaws.com/my-nodeapp