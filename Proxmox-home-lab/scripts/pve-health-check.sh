#!/bin/bash
# 📊 Proxmox Hypervisor Health Audit & Backup Status
# Purpose: Professional monitoring for Bare Metal nodes.

echo "--- PROXMOX SYSTEM HEALTH REPORT ($(date)) ---"

# 1. Check CPU & Memory Usage
echo -e "\n[CPU/RAM Utilization]"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " $2 "%"}'
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'

# 2. Check ZFS Pool Health (Crucial for Proxmox)
echo -e "\n[ZFS Storage Status]"
zpool list
zpool status | grep "errors" || echo "No ZFS errors detected."

# 3. Check Backup Jobs (Ensuring Data Recovery)
echo -e "\n[Recent Backup Tasks]"
ls -lh /var/lib/vz/dump | tail -n 5 || echo "No backups found in local dump."

# 4. Temperature Check (Preventing Hardware Failure)
echo -e "\n[Hardware Temps]"
sensors | grep "Core" || echo "lm-sensors not installed."

echo -e "\n--- End of Report ---"
