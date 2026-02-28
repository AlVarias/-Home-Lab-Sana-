# 🌐 Proxmox Network Architecture

### Linux Bridge Configuration (`vmbr0`)
* **Physical Port:** `eno1` (1Gbps copper)
* **IP Address:** `10.5.0.10/24`
* **Gateway:** `10.5.0.1`

### Internal VLAN Assignments
| VLAN ID | Name | Subnet | Use Case |
| :--- | :--- | :--- | :--- |
| **VLAN 10** | Management | `10.5.10.0/24` | Jump-box, SSH, PVE Web UI |
| **VLAN 20** | Production | `10.5.20.0/24` | Docker Hosts, Web Servers |
| **VLAN 99** | DMZ | `10.5.99.0/24` | Public-facing services (VPN) |
