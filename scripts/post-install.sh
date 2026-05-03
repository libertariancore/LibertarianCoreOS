#!/bin/bash
set -e

# 1. Shell Fish par défaut
chsh -s /usr/bin/fish

# 2. Hardening Réseau (Anti-Tracking & Anti-IPv6)
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf

# 3. DNS Souverain (Quad9)
mkdir -p /etc/NetworkManager/conf.d
cat <<EOF > /etc/NetworkManager/conf.d/dns.conf
[main]
dns=none
EOF
echo "nameserver 9.9.9.9" > /etc/resolv.conf

# 4. Activation des services (Virtualisation + IA + Android)
systemctl enable libvirtd
systemctl enable --now waydroid-container

# 5. IA Locale (Ollama)
curl -fsSL https://ollama.com/install.sh | sh
systemctl enable ollama

# 6. Sécurité Hardware (Blacklist Bluetooth)
echo "blacklist btusb" > /etc/modprobe.d/disable-bluetooth.conf
