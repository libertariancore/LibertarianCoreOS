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

flatpak remote-add --if-not-exists flathub \
  https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y --noninteractive flathub \
  com.brave.Browser \
  io.gitlab.librewolf-community.librewolf \
  org.torproject.torbrowser-launcher \
  io.simplex.simplex \
  com.github.tchx84.Flatseal \
  com.belmoussaoui.Authenticator \
  org.onlyoffice.desktopeditors \
  net.ankiweb.Anki \
  org.gnome.Thunderbird \
  com.visualstudio.code \
  com.usebottles.bottles \
  com.heroicgameslauncher.hgl \
  com.github.Matoking.protontricks \
  net.lutris.Lutris \
  tv.kodi.Kodi \
  org.videolan.VLC \
  io.bassi.Amberol \
  io.github.ferraridamiano.ConverterNOW \
  io.gitlab.news_flash.NewsFlash \
  net.cozic.joplin_desktop \
  org.localsend.localsend_app \
  com.ktechpit.ultimate-media-downloader
