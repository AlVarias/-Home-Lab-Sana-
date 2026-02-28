#!/bin/bash
# 🛡️ Post-Provisioning Hardening for Remote Management VM

echo "--- HARDENING REMOTE CONTROL VM ---"

# 1. Update System
sudo apt update && sudo apt upgrade -y

# 2. Install Management Tools
sudo apt install -y tailscale htop net-tools tmux

# 3. Secure SSH
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

# 4. Set up Firewall (Allow SSH only)
sudo ufw allow ssh
sudo ufw enable

echo "VM Hardened. Access via SSH Key or Tailscale only."
