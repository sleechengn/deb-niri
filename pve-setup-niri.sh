#!/usr/bin/env bash

set -x

PACK_PATH=$(realpath $(dirname $0))

apt install -y $PACK_PATH/niri_26.4.0-1_amd64.deb
apt install -y $PACK_PATH/mpvpaper_20260812-1_amd64.deb
apt install -y $PACK_PATH/swww_0.11.2~master2-1_amd64.deb
apt install -y $PACK_PATH/swww-daemon_0.11.2~master2-1_amd64.deb
apt install -y $PACK_PATH/xwayland-satellite_0.8.2-1_amd64.deb

apt install -y alacritty fuzzel swaybg waybar nautilus nautilus-extension-gnome-terminal
apt install -y libpipewire-0.3-0 libpipewire-0.3-dev libdisplay-info2 libseat1 libinput10 libegl1 libegl-mesa0
apt install -y pavucontrol pipewire pipewire-pulse wireplumber

apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-modify flathub --url=https://mirrors.ustc.edu.cn/flathub
flatpak install --noninteractive -y com.microsoft.Edge

apt install -y fonts-noto-cjk-extra
apt install -y fcitx5 fcitx5-table-wubi98

# user
if [ ! -e "/home/sa" ]; then
	useradd -m --uid 100000 sa
	usermod -aG input,video sa
	echo "sa:123456" | chpasswd
fi

systemctl --user -M sa@ daemon-reload
systemctl --user -M sa@ enable --now pipewire pipewire-pulse wireplumber
