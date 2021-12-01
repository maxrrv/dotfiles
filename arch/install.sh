
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime # set timezone
hwclock --systohc # set system clock to hardware clock
sed -i '<linenumber>s/ .//' etc/locale.gen # uncomment used locale
locale-gen
echo "LANG=en_US.UTF_8" > /etc/locale.conf
echo "<hostname>" > /etc/hostname

# configure localhost
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.0.1 <hostname>.localdomain <hostname>" >> /etc/hosts

echo "root:<rootpwd>" | chpasswd

pacman -S nvidia nvidia-settings nvidia-utils
# add more packages to be installed here
pacman -S networkmanager grub efibootmgr bash-completion os-prober

systemctl enable NetworkManager
grub-install --target=x86_64-efi --efi-directory=/boot/efi #if created during partitioning. else, path to efi directory
grub-mkconfig -o /boot/grub/grub.cfg

# add local user
useradd -m -g users -G audio,video,network,wheel,storage,rfkill -s /bin/bash maxrrv
echo "maxrrv:<password>" | chpasswd
echo "maxrrv ALL=(ALL) ALL" >> /etc/sudoers.d/maxrrv



# Further reference
# https://www.youtube.com/watch?v=o09jzArQcFQ
# https://www.arcolinuxd.com/5-the-actual-installation-of-arch-linux-phase-1-uefi/
# if graphics card driver added, do following:
# vim /etc/mkinitcpio.conf and add your graphics card to MODULES=()
# amdgpu / nvidia / i915
# then
# mkinitcpio -p linux-lts or whatever kernel you are using
