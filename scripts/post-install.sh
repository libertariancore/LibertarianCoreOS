#!/bin/bash
set -eu

# 1. Hardening Réseau (Anti-IPv6)
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf

# 2. DNS Souverain (Quad9)
mkdir -p /etc/NetworkManager/conf.d
cat <<EOF > /etc/NetworkManager/conf.d/dns.conf
[main]
dns=none
EOF
echo "nameserver 9.9.9.9" > /etc/resolv.conf

# 3. Activation services
systemctl enable libvirtd || true

# 4. Sécurité Hardware (Blacklist Bluetooth)
echo "blacklist btusb" > /etc/modprobe.d/disable-bluetooth.conf
