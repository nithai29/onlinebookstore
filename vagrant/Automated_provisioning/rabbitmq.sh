#!/bin/bash
echo "Install updating and installing epel-release and wget"
sudo amazon-linux-extras install epel -y
sudo yum update -y
sudo yum install wget -y
echo " "
echo " "
echo "Changing dir to /opt and downloading and installing erland and socat"
cd /opt
sudo wget https://packages.erlang-solutions.com/erlang/rpm/centos/7/x86_64/esl-erlang_25.0.3-1~centos~7_amd64.rpm
sudo yum install esl-erlang_25.0.3-1~centos~7_amd64.rpm -y
sudo yum install socat -y
echo " "
echo " "
echo "Downloading and installing rabbitmq server "
sudo wget https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.11.15/rabbitmq-server-3.11.15-1.el8.noarch.rpm
sudo rpm -ivh rabbitmq-server-3.11.15-1.el8.noarch.rpm
echo " "
echo " "
echo "Starting Rabbitmq server "
sudo systemctl start rabbitmq-server
sudo systemctl enable rabbitmq-server
sudo systemctl status rabbitmq-server
sudo sh -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'
sudo rabbitmqctl add_user test test
sudo rabbitmqctl set_user_tags test administrator
sudo systemctl restart rabbitmq-server