#!/bin/bash
set -eu

# 1. Anti-IPv6
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf

# 2. DNS Quad9
mkdir -p /etc/NetworkManager/conf.d
cat <<EOF > /etc/NetworkManager/conf.d/dns.conf
[main]
dns=none
EOF

# 3. Services
systemctl enable libvirtd || true

# 4. Blacklist Bluetooth
echo "blacklist btusb" > /etc/modprobe.d/disable-bluetooth.conf
