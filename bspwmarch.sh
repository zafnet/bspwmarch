# ! /bin/bash/
 
##################################################################################
 
# PARA ACTUALIZAR ARCH LINUX CON BSPWM E INSTALAR LOS PROGRAMAS A CONTINUACION INDICADOS
 
pacman -Syu -y --noconfirm

pacman -S polybar

pacman -S xclip -y --noconfirm

pacman -S gvfs  -y --noconfirm
 
pacman -S nmap -y --noconfirm
 
pacman -S tilix -y --noconfirm
 
pacman -S tmux -y --noconfirm
 
pacman -S xdg-user-dirs -y --noconfirm
 
xdg-user-dirs-update
 
pacman -S zsh -y --noconfirm
 
pacman -S lsd -y --noconfirm
 
pacman -S chromium -y --noconfirm
 
pacman -S firefox -y --noconfirm
 
pacman -S telegram-desktop -y --noconfirm
 
pacman -S discord -y --noconfirm
 
pacman -S rofi -y --noconfirm
 
pacman -S i3lock-fancy -y --noconfirm
 
pacman -S bspwm -y --noconfirm
 
pacman -S sxhkd -y --noconfirm
 
pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings -y --noconfirm
 
systemctl enable lightdm.service
 
systemctl start lightdm.service
 
pacman -S xorg -y --noconfirm
 
pacman -S xterm -y --noconfirm
 
pacman -S picom -y --noconfirm
 
pacman -S pcmanfm -y --noconfirm
 
pacman -S thunar -y --noconfirm
 
pacman -S lxappearance  -y --noconfirm
 
pacman -S neofetch -y --noconfirm

pacman -S os-prober -y --noconfirm 

pacman -S zathura -y --noconfirm

pacman -S zathura-pdf-poppler -y --noconfirm
 
pacman -S zsh-autosuggestions -y --noconfirm
 
pacman -S zsh-syntax-highlighting -y --noconfirm
 
#pacman -S vlc  -y --noconfirm
 
pacman -S feh  -y --noconfirm
 
pacman -S xed -y --noconfirm
 
#pacman -S ranger -y --noconfirm
 
pacman -S htop -y --noconfirm
 
cp -r /usr/share/zsh/plugins/zsh-syntax-highlighting/ /usr/share/
 
cp -r /usr/share/zsh/plugins/zsh-autosuggestions/ /usr/share/
###################################################################################
# PARA REMOVER Y AGREGAR DOTFILES MIOS A SUS CARPETAS CORRESPONDIENTES
cp    /home/newvash/bspwmarch/.tmux/.tmux.conf  /home/newvash/
cp    /home/newvash/bspwmarch/.tmux/.tmux.conf.local  /home/newvash/
cp -r /home/newvash/bspwmarch/.oh-my-zsh/ /home/newvash/
cp -r /home/newvash/bspwmarch/Infinity-Lavender-Dark-Icons/ /usr/share/icons/
cp -r /home/newvash/bspwmarch/Lavender-Breeze-GTK/ /usr/share/themes/
cp -r /home/newvash/bspwmarch/.wallpapers/ /home/newvash/
cp -r /home/newvash/bspwmarch/tilix/ /usr/share/
cp -r /home/newvash/bspwmarch/Thunar/ /home/newvash/.config/
cp -r /home/newvash/bspwmarch/rofi/  /home/newvash/.config/
cp  /home/newvash/bspwmarch/.zshrc /home/newvash/
cp  /home/newvash/bspwmarch/.p10k.zsh  /home/newvash/
cp  /home/newvash/bspwmarch/.bashrc  /home/newvash/
cp  /home/newvash/bspwmarch/.Xresources  /home/newvash/
cp -r /home/newvash/bspwmarch/nvim/  /home/newvash/.config/
cp  /home/newvash/bspwmarch/.nanorc /home/newvash/.nanorc

###CONFIG CON XFCE E i3#################################################
#cp -r /home/newvash/bspwmarch/i3/  /home/newvash/.config/
#cp -r /home/newvash/bspwmarch/terminal/ /usr/share/xfce4/
#cp -r /home/newvash/bspwmarch/xfce4/  /home/newvash/.config/
 
#######################################################################
 
##COPIA CARPETAS DE BSPWM,PICOM Y SXHKD EN .CONFIG EN VEZ DE CREARLAS
 
cp -r /home/newvash/bspwmarch/bspwm/ /home/newvash/.config/
chmod +x /home/newvash/.config/bspwm/bspwmrc
cp -r /home/newvash/bspwmarch/sxhkd/ /home/newvash/.config/
chmod +x /home/newvash/.config/sxhkd/sxhkdrc
cp -r /home/newvash/bspwmarch/picom/  /home/newvash/.config/
chmod +x /home/newvash/.config/picom/picom.conf
cp -r /home/newvash/bspwmarch/polybar/  /home/newvash/.config/
chmod +x /home/newvash/.config/polybar/config
chmod +x /home/newvash/.config/polybar/launch.sh
#######################################################################
 
###ENLACES SIMBOLICOS###########################################
cd / && cd root/
 
ln -s -f /home/newvash/.zshrc .zshrc
 
ln -s -f /home/newvash/.tmux.conf.local .tmux.conf.local
 
ln -s -f /home/newvash/.tmux.conf .tmux.conf
 
ln -s -f /home/newvash/.p10k.zsh .p10k.zsh
 
ln -s -f /home/newvash/.nanorc .nanorc
 
cp -r /home/newvash/bspwmarch/.oh-my-zsh/ . 
 
cp  /home/newvash/bspwmarch/.bashrcroot .

mv .bashrcroot .bashrc
 
######################################################################################################
 
# PARA AGREGAR FONTS
 
cp -r /home/newvash/bspwmarch/fonts/ /usr/share/
 
############################################################################################################################
#PARA INSTALAR QEMU
 
#QEMU INSTALACION:
 
pacman -S qemu qemu-guest-agent qemu-arch-extra qemu-block-gluster qemu-block-iscsi qemu-block-rbd samba -y --noconfirm
#############################################################################################################################
 
 
ACTIVAMOS EL SERVICIO PARA  GUEST
 
systemctl enable qemu-ga 
 
 
 
systemctl start qemu-ga 
#######################################################################################################################
 
KVM QEMU driver
 
pacman -S virt-viewer virt-manager libvirt ebtables dnsmasq bridge-utils openbsd-netcat -y --noconfirm
 
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
 
pacman -S spice spice-gtk spice-vdagent xf86-video-qxl -y --noconfirm
 
systemctl enable spice-vdagentd
 
systemctl start spice-vdagentd
###############################################################################################################################

##################################################
# para que pueda usar UEFI en QEMU

pacman -S ovmf -y --noconfirm

############################################# 


# DEFINIR CONEXION NAT
 
#virsh net-define /etc/libvirt/qemu/networks/default.xml
 
 
#Que inicie automatico
 
#virsh net-autostart default 
 
#Activar NAT
 
#virsh net-start default

