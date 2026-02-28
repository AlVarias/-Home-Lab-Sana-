# -Home-Lab-Sana-
production-ready Home Lab Security Stack using Docker Compose to orchestrate WireGuard VPN, Pi-hole DNS Firewall, and Uptime Kuma monitoring on an isolated bridge network.

## "It's not a circus, it's an infrastructure."

This repository contains my personal home-lab security stack, deployed via **Docker Compose**. It’s designed to provide secure remote access, network-level ad-blocking, and real-time service monitoring.

## 🚀 The Stack
* **WireGuard (VPN):** Fast, modern, and encrypted tunneling.
* **Pi-hole (DNS Firewall):** Preventing telemetry and trackers from leaving the network.
* **Uptime Kuma (Observability):** Monitoring the health of my "clown car" (home server) and sending alerts if services drop.

## 🛠️ Technical Deep-Dive
* **Custom Bridge Network:** All services reside on a dedicated `10.5.0.0/24` subnet.
* **Persistence:** All configurations are mapped to local volumes for easy backups.
* **Service Discovery:** Configured Pi-hole as the primary upstream DNS for VPN peers to ensure consistent security policies across all connected devices.

## 📊 Deployment
1. Clone the repo.
2. Update the `SERVERURL` in `docker-compose.yml`.
3. Run `docker-compose up -d`.
4. Check the Uptime Kuma dashboard at `localhost:3001` to make sure everything is green.



