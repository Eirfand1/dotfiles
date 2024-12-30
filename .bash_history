clear
xbps-install openbox tint2 chromium vim
sudo xbps-install openbox tint2 chromium vim
sudo xbps-install -Su
sudo vim /etc/default/grub 
sudo os-prober
sudo grub-mkconfig
sudo update-grub
sudo xbps-install kitty
openbox
sudo xbps-install xorg
sudo xbps-install -S obconf obmenu-generator tint2
exec openbox-session
startx
exec openbox-session
clear
kitty
tint2
clear
mkdir -p ~/.config/openbox
echo "tint2 &" > ~/.config/openbox/autostart
chmod +x ~/.config/openbox/autostart
sudo xbps-install -S dmenu
cd ~/.config/openbox/
vim rc.xml
openbox --reconfigure
dmenu_run

sudo xbps-install thunar-filemanager
sudo xbps-install -S gmrun
sudo xbps-install nautilus
obmenu
obmenu-generator
sudo xbps-install thunar
dmenu_run
sudo xbps-install git
git clone https://github.com/addy-dclxvi/tint2-theme-collections ~/.config/tint2 --depth 1
git clone https://github.com/addy-dclxvi/tint2-theme-collections ~/.config/tint2
git clone https://github.com/addy-dclxvi/tint2-theme-collections ~/.config/ --depth 1
git clone https://github.com/addy-dclxvi/tint2-theme-collections ~/.config --depth 1
git clone https://github.com/addy-dclxvi/tint2-theme-collections --depth 1
ls tint2-theme-collections/
mv tint2-theme-collections/ ~/.config/
cd .config
cd ..
ls
cd tint2-theme-collections/
ls
cp * ~/.config/tint2
cp -r * ~/.config/tint2
tint2 -c ~/.config/tint2/blocks/blocks.tint2rc &
tint2 -c ~/.config/tint2/blocks/livia.tint2rc &
clear
ls
sudo xbps-install feh
ls
feh 844905.png 
feh --bg-fill 844905.png 
cd .config
ls
cd openbox
ls
vim autostart 
vim autostart 
cd wallpaper/
ls
mv 844905.png cat.png
ls
touch ~/.Xauthority
chmod 600 ~/.Xauthority
sudo xbps-install -S xorg-server xorg-apps xauth
echo "exec openbox-session" > ~/.xinitrc
chmod +x ~/.xinitrc 
sudo chmod +x ~/.xinitrc 
startx
sudo xbps-install urxvt
sudo xbps-install rxvt-unicode
startx
startx
startx
reboot
sudo reboot
curl -fsS https://dl.brave.com/install.sh | sh
sudo xbps-install curl
curl -fsS https://dl.brave.com/install.sh | sh
curl -fsS https://dl.brave.com/install.sh | sh
nm-applet
sudo xbps-install nm-applet
cd ..
ls
cd Downloads
cd ~/Downloads
ls
./brave-bin-1.63.169_1
cd brave-bin-1.63.169_1
ls
sudo xbps-install brave-bin-1.63.169_1.x86_64.xbps
sudo xbps-install ./brave-bin-1.63.169_1.x86_64.xbps
sudo xbps-install ./brave-bin-1.63.169_1.x86_64.xbps
ls
xbps-query -l | grep brave
clear
ls
xbps-install ./brave.xbps
sudo xbps-install ./brave.xbps
sudo xbps-install -f ./brave.xbps
sudo xbps-install network-manager-applet
sudo rm /var/db/xbps/lock
sudo rm /var/db/xbps/lock
sudo xbps-install ./brave.xbps
sudo xbps-install brave
nm-applet
sudo nm-applet
clear
sudo xbps-install -S fish
sudo xbps-install -S fish-shell
chsh -s /usr/bin/fish
nm-applet
cd .config/tint2
ls
cd repentance/
ls
vim repentance.tint2rc 
sudo xbps-install mousepad
mousepad repentance.tint2rc 
vim repentance.tint2rc 
vim repentance.tint2rc 
nm-applet 
clear
cd ..
cd ..
ls
cd openbox/
ls
vim rc.xml 
vim autostart 
kitty
fish
startx
cd .config
ls
cd tint2
ls
cd repentance/
ls
vim repentance.tint2rc 
sudo xbps-install nm-applet
sudo xbps-install xfce4-thunar
sudo xbps-install xfce
sudo xbps-install xfce4
sudo xbps-install -S xbacklight
xbacklight -inc 10
xbacklight -inc 10
sudo xbps-install -S brightnessctl
brightnessctl s 10%-
cd .config/ope
cd ..
cd --
cd .config/openbox/
clear
ls
vim rc.xml 
vim rc.xml 
openbox --reconfigure
sudo brightnessctl s 10%-
sudo brightnessctl s 10%-
sudo brightnessctl s 10%-
brightnessctl s 10%-
sudo usermod -aG video $USER
sudo chmod u+w /sys/class/backlight/intel_backlight/brightness
brightnessctl s 10%-
vim rc.xml 
sudo usermod -aG video $USER
brightnessctl s +10%
sudo usermod -aG video yuki
brightnessctl s +10%
ls /sys/class/backlight/
ls -l /sys/class/backlight/intel_backlight/brightness
sudo chmod u+w /sys/class/backlight/intel_backlight/brightness
brightnessctl s +10%
sudo chown $USER:$USER /sys/class/backlight/intel_backlight/brightness
brightnessctl s +10%
vim rc.xml 
openbox --reconfigure
sudo reboot
sudo tee /etc/sv/postgresql/run << EOF
#!/bin/sh
exec 2>&1
exec chpst -u postgres:postgres postgres -D /var/lib/postgresql/data
EOF

sudo chmod +x /etc/sv/postgresql/run
sudo ln -s /etc/sv/postgresql /var/service/
sudo ln -s /etc/sv/postgresql /var/service/
sudo sv start postgresql
sudo sv start postgresql
sudo rm /var/service/postgresql
sudo ln -s /etc/sv/postgresql /var/service/
sudo sv restart postgresql
sudo -u postgres psql
psql
sudo xbps-install -S postgresql-client
sudo -u postgres psql
fish
clear
git clone https://github.com/wick3dr0se/sysfetch; cd ${_##*/}
neofetch
clear
sudo cp sysfetch /usr/bin/local/
sudo cp sysfetch /usr/local/bin/
sysfetch
clear
fish
exit
