#!/bin/bash

apt update -y
apt install -y nginx


systemctl enable nginx
systemctl start nginx


echo "welcome to nginx page " > /var/www/html/index.html
