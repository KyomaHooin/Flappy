
X1

https://github.com/yksoft1/xmil/tree/emscripten

MZ-800

https://sourceforge.net/projects/mz800emu/

PC-88

https://www.eonet.ne.jp/~showtime/quasi88/
http://retropc.net/pi/

RPI
<pre>
wget --no-check-certificate https://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-04-09/2019-04-08-raspbian-stretch-lite.zip
umount /dev/sda[12] 2> /dev/null
unzip -p 2019-04-08-raspbian-stretch-lite.zip | dd of=/dev/sda bs=4M

touch /boot/ssh
cat << EOF >> /boot/wpa_supplicant.conf
country=CZ
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
	ssid="Wireless LAN"
	scan_ssid=1
	psk="cleartext"
	key_mgmt=WPA-PSK
}
EOF

apt-get install git vim mc

~/.bashrc:

alias vi='vim -c "set vb" -c "syntax enable" -c "set mouse ="'

/etc/rc.local:

/root/firewall &

/etc/dhcpcd.conf:
interface wlan0
static ip_address=192.168.0.83/24
static routers=192.168.0.1
static domain_name_servers=xx.xx.xx.xx xx.xx.xx.xx

systemctl disable avahi-daemon bluetooth paxctld rsync triggerhappy dphys-swapfile apt-daily apt-daily.timer apt-daily-upgrade apt-daily-upgrade.timer

apt-get install libgl1-mesa-dri

raspi-config > Advanced Options > Memory Split > 128
raspi-config > Advanced Options > GL Driver > Fake KMS

dphys-swapfile swapoff
dphys-swapfile uninstall

/etc/fstab:
tmpfs	/tmp	tmpfs	defaults,noatime,nosuid,size=5m	0	0
</pre>

UART

<pre>
/boot/config.txt:
enable_uart=1
</pre>

SDL2

<pre>
wget https://www.libsdl.org/release/SDL2-2.0.14.tar.gz

apt-get install autoconf libgles2-mesa-dev libgbm-dev libudev-dev libasound2-dev liblzma-dev

autogen.sh
./configure --enable-video-kmsdrm --disable-video-opengl --disable-video-x11 --disable-video-rpi
make
make install
</pre>

FILE

<pre>

PC88/xm8 - PC8801 core by TakedaToshiya / XM8 emulator Tanaka Yasushi(PI).

