# ! /bin/bash/

##################################################################################

# PARA ACTUALIZAR ARCH LINUX CON BSPWM E INSTALAR LOS PROGRAMAS A CONTINUACION INDICADOS

pacman -Syu -y --noconfirm

pacman -S tilix -y --noconfirm

pacman -S xdg-user-dirs -y --noconfirm

xdg-user-dirs-update

pacman -S chromium -y --noconfirm

pacman -S firefox -y --noconfirm

pacman -S telegram-desktop -y --noconfirm

pacman -S discord -y --noconfirm

pacman -S rofi -y --noconfirm

#yay -s polybar -y --noconfirm

pacman -S bspwm -y --noconfirm

pacman -S sxhkd -y --noconfirm

pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings -y --noconfirm

systemctl enable lightdm.service

pacman -S xorg -y --noconfirm

pacman -S xterm -y --noconfirm

pacman -S picom -y --noconfirm

pacman -S thunar -y --noconfirm

pacman -S lxappearance  -y --noconfirm

pacman -S neofetch -y --noconfirm

pacman -S epdfview -y --noconfirm

pacman -S vlc  -y --noconfirm

pacman -S feh  -y --noconfirm

pacman -S xed -y --noconfirm

pacman -S ranger -y --noconfirm

pacman -S htop -y --noconfirm

###################################################################################


# PARA REMOVER Y AGREGAR DOTFILES MIOS A SUS CARPETAS CORRESPONDIENTES

cp -r /home/usuario/bspwmarch/Infinity-Lavender-Dark-Icons/ /usr/share/icons

cp -r /home/usuario/bspwmarch/Lavender-Breeze-GTK/ /usr/share/themes


cp -r /home/usuario/bspwmarch/.wallpapers/ /home/usuario/

cp -r /home/usuario/bspwmarch/tilix/ /usr/share/

#cp -r /home/usuario/bspwmarch/terminal/ /usr/share/xfce4/

cp -r /home/usuario/bspwmarch/Thunar/ /home/usuario/.config/

#cp -r /home/usuario/bspwmarch/xfce4/  /home/usuario/.config/

######################################################################################################

# PARA CREAR LAS CARPETAS BSPWM,COMPTON Y SXHKD EN .CONFIG

mkdir -p /home/usuario/.config/bspwm/

mkdir -p /home/usuario/.config/sxhkd/

mkdir -p /home/usuario/.config/picom/

cp -r /home/usuario/bspwmarch/rofi/  /home/usuario/.config/

cp /home/usuario/bspwmarch/bspwmrc /home/usuario/.config/bspwm

chmod +x /home/usuario/.config/bspwm/bspwmrc

cp /home/usuario/bspwmarch/sxhkdrc  /home/usuario/.config/sxhkd

chmod +x /home/usuario/.config/sxhkd/sxhkdrc

cp /home/usuario/bspwmarch/picom.conf  /home/usuario/.config/picom

chmod +x /home/usuario/.config/picom/picom.conf

#cp -r /home/usuario/bspwmarch/polybar/ /home/usuario/.config/
######################################################################################################

# PARA AGREGAR FONTS

cp -r /home/usuario/bspwmarch/fonts/ /usr/share/

############################################################################################################################
#PARAA INSTALAR QEMU

#QEMU INSTALACION:

sudo pacman -S qemu qemu-guest-agent qemu-arch-extra qemu-block-gluster qemu-block-iscsi qemu-block-rbd samba -y --noconfirm
#############################################################################################################################


ACTIVAMOS EL SERVICIO PARA  GUEST

systemctl enable qemu-ga 



systemctl start qemu-ga 
#######################################################################################################################

KVM QEMU driver

sudo pacman -S virt-viewer virt-manager libvirt ebtables dnsmasq bridge-utils openbsd-netcat -y --noconfirm

#########################################################################################################################
#ACTIVAMOS SEVICIOS KVM

systemctl enable libvirtd virtlogd



systemctl start libvirtd virtlogd



systemctl enable virtlogd.socket



systemctl start virtlogd.socket



systemctl enable virtlockd.socket



systemctl start virtlockd.socket
#############################################################################################################################

#MONITOR SPICE

sudo pacman -S spice spice-gtk spice-vdagent xf86-video-qxl -y --noconfirm

systemctl enable spice-vdagentd

systemctl start spice-vdagentd
###############################################################################################################################

# DEFINIR CONEXION NAT

sudo virsh net-define /etc/libvirt/qemu/networks/default.xml


#Que inicie automatico

sudo virsh net-autostart default 

#Activar NAT

sudo virsh net-start default

