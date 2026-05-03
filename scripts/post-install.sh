#!/bin/bash

# 1. Anti-IPv6
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf || true
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf || true

# 2. Blacklist Bluetooth
echo "blacklist btusb" > /etc/modprobe.d/disable-bluetooth.conf || true
