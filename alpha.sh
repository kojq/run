#!/usr/bin/env sh

cd ~

echo 'SUBSYSTEM=="block", ENV{ID_FS_TYPE}=="ntfs", ENV{ID_FS_TYPE}="ntfs3"' | sudo tee /etc/udev/rules.d/ntfs3_by_default.rules
sudo sed -i "s/^#ParallelDownloads = 5$/ParallelDownloads = 36/" /etc/pacman.conf
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

#system tools
sudo pacman -Syu git wget curl fzf helix imagemagick ffmpeg mpv bluez bluez-utils

#applications
sudo pacman -S lapce qbittorrent blender inkscape gimp obs-studio diffuse meld desmume dolphin-emu

#fonts
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra

#drivers
sudo pacman -S nvidia-dkms

#steam
sudo pacman -S lib32-nvidia-utils lib32-vulkan-radeon steam

#virtual machine
sudo pacman -S virt-manager qemu-desktop libvirt edk2-ovmf dnsmasq iptables-nft

#kitty pcmanfm refind booster borg bupstash restic

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

#system tools
paru -S fastfetch-git cloudflare-warp-bin pandoc-bin ventoy-bin linux-wifi-hotspot

#applications
paru -S brave-bin onlyoffice-bin cemu citra-qt-bin bottles gdm-settings

#fonts
paru -S ttf-ms-win11-auto apple-fonts

#asus tools
paru -S asusctl-git supergfxctl-git

#visual-studio-code-bin jetbrains-fleet librewolf-bin fprintd yuzu-mainline-bin ryujinx-git btrbk kopia-bin vorta pika-backup backintime rog-control-center ulauncher tofi kickoff/wofi/fuzzel/bemenu
#ttf-ms-win11-auto-japanese ttf-ms-win11-auto-korean ttf-ms-win11-auto-other ttf-ms-win11-auto-sea ttf-ms-win11-auto-thai ttf-ms-win11-auto-zh_cn ttf-ms-win11-auto-zh_tw

systemctl enable --now nftables.service
systemctl enable --now bluetooth.service
systemctl enable --now warp-svc.service
systemctl enable --now libvirtd.service
systemctl enable --now power-profiles-daemon.service
systemctl enable --now supergfxd.service

yes | warp-cli register
warp-cli set-families-mode malware
warp-cli set-mode warp
warp-cli connect

#sudo pacman -S cups cups-pdf
#systemctl enable --now cups.socket
#set ChangeFanProfile, fn+f5 to asusctl profile -n
#set fn+f4, fn+f6, ROG Key, and ctrl+shift+delete