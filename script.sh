#!/bin/bash
echo "🚀 Let's Start to setup vps ! 🚀"
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo apt install -y iptables
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -s Your_IP_Public -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j DROP
sudo -s iptables-save -c
sudo iptables -L --line-numbers
echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf
echo "🚀 Let's goooo ! 🚀"