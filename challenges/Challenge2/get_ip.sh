#!/bin/zsh
My_IP=$(curl -4 https://ipv4.icanhazip.com)
echo "{ \"My_IP\": \"$My_IP/32\" }"