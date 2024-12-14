#!/bin/bash

#Author: Ifeanyi
#Date: 14/12/2024
#Task:
#..Install apache webserver,
#..Download and copy the frontend template on webservers,
#..Execute this task using shell scripting
#version: v1

echo "Installing apache webserver"
sudo apt update -y
sudo apt install apache2 -y

echo "Downloading Frontend Template"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip
unzip 2137_barista_cafe.zip

sudo cp -r 2137_barista_cafe/* /var/www/html
sudo systemctl restart apache2

cd ~
rm -rf /tmp/webfiles
