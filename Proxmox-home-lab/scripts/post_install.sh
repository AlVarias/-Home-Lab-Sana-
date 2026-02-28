#!/bin/bash
# Description: Post-install optimization for Proxmox VE
# 1. Remove the 'No Subscription' nag
# 2. Add the 'No-Subscription' repository
# 3. Update the system

echo "--- OPTIMIZING PROXMOX VE ---"

# Add No-Subscription Repo
echo "deb http://download.proxmox.com/debian/pve buster pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list

# Remove Enterprise Repo (which requires a key)
rm -f /etc/apt/sources.list.d/pve-enterprise.list

# Disable the Nag Popup
sed -i.bak "s/data.status !== 'Active'/false/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js

apt update && apt dist-upgrade -y
echo "Proxmox is now updated and optimized!"
