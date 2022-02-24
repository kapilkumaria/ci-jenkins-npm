#!/bin/bash
sudo su 
sudo apt update -y
sudo apt install openjdk-8-jdk -y
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 931058976119.dkr.ecr.us-east-1.amazonaws.com
docker build -t my-nodeapp .
docker tag my-nodeapp:latest 931058976119.dkr.ecr.us-east-1.amazonaws.com/my-nodeapp:latest
docker push 931058976119.dkr.ecr.us-east-1.amazonaws.com/my-nodeapp:latest
