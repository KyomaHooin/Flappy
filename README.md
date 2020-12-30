
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

/etc/dhcpcd.conf:
interface wlan0
static ip_address=192.168.0.83/24
static routers=192.168.0.1
static domain_name_servers=xx.xx.xx.xx xx.xx.xx.xx
</pre>

UART

<pre>
/boot/config.txt:

enable_uart=1
</pre>
