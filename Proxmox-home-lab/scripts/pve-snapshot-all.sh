#!/bin/bash
# 📸 Automated Proxmox Bulk Snapshot
# Use Case: Running a full-lab backup before a major upgrade.

SNAPSHOT_NAME="Pre_Maintenance_$(date +%F)"

echo "Starting bulk snapshot: $SNAPSHOT_NAME"

# Get all running VM IDs
for vmid in $(qm list | awk '{if(NR>1) print $1}'); do
    echo "Creating snapshot for VM $vmid..."
    qm snapshot $vmid "$SNAPSHOT_NAME" --description "Automated pre-patching snapshot"
done

echo "Bulk snapshots completed."
