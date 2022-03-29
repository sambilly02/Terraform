#!/bin/sh
sudo apt update
sudo apt-get install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx