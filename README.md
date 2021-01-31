
X1

https://github.com/yksoft1/xmil/tree/emscripten

MZ-800

https://sourceforge.net/projects/mz800emu/

PC-88

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
tmpfs	/var/log	tmpfs	defaults,noatime,nosuid,mode=0755,size=5m	0	0

/etc/default/keyboard:

XKBLAYOUT='us'
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

![PC88](https://github.com/kyomahooin/Flappy/raw/master/Flappy_PC88.png "Flappy")

POC88 - Flappy [1983]

![PC88](https://github.com/kyomahooin/Flappy/raw/master/King_Flappy_PC88.png "King Flappy")

PC88 - King Flappy [1985]

<pre>

PC88/xm8 - PC8801 core by Takeda Toshiya | XM8 emulator by Tanaka Yasushi(PI).

Kana/Romaji    = [Scroll Lock]
Small Kana     = [Shift] + Kana

Control        = [2],[4],[6],[8]
Shoot          = [Space]

Exit           = [F8]
Menu           = [F11]
</pre>

PC88 ROM:

<pre>
N80.ROM    [5b922ed9de07d2a729bdf1da7b57c50ddf08809a]
N88.ROM    [3b31fc68fa7f47b21c1a1cb027b86b9e87afbfff]
N88_0.ROM  [d239c26ad7ac5efac6e947b0e9549b1534aa970d]
N88_1.ROM  [8528eef7946edf6501a6ccb1f416b60c64efac7c]
N88_2.ROM  [b7c8bcea219b77d9cc3ee0efafe343cc307425d1]
N88_3.ROM  [efce0b51cab9f0da6cf68507757f1245a2867a72]
DISK.ROM   [bb7103a0818850a039c67ff666a31ce49a8d516f]
KANJI1.ROM [82e11a177af6a5091dd67f50a2f4bafda84d6556]
KANJI2.ROM [7e6591cd465cbb35d6d3446c5a83b46d30fafe95]
FONT.ROM   [425a896af83386c7bafac59f94211cdbb9cce18d]
PC88.ROM   [607db1d7affacaa4839d54c2c649602322b931bf]
</pre>

Flappy ROM:

<pre>
Flappy.d88        [703212fb302c1b6aa99ee17dbe33ef68ccc0a622]
Flappy_a.d88      [083caf374c14b25190677adeec1e1e0cb203e190]
Flappy_a2.d88     [5221dbd3f71b3515df486de754e2f4065a73a60c]
King_Flappy.d88   [73395ab7b4dfdda930906986540b4c5b0b2e5a20]
King_Flappy_a.d88 [345021bcb1c67ab7ddd1aa379628f791b0bc79fe]

[aN] = Alternative ROM. (TOSEC dump info)
</pre>

TODO

<pre>
-Disable sound, softkey, statusbar, menu.
-Default setttings.
-Default reset.
</pre>

MAME

<pre>
apt-get install libgl1
apt-get install qt5-default

./mame -cc

mame.ini tunning

[mame pc8801]
[mame x1]

mame -listfull x1
mame -listfull pc8801

mame -listroms x1
mame -listroms pc8801

sha1sum iplrom.x1

mame -listmedia x1

./castool convert x1 'roms/Flappy.tap' 'roms/Flappy.wav'

###########

mame x1 -cass 'roms/Flappy.tap'

##########

Choccyhobnob mame.ini performace

# ./mame -verifyroms pc8801
romset pc8801 is good
1 romsets found, 1 were OK.

i# ./mame -verifyroms x1
x1          : 80c48 (4096 bytes) - NOT FOUND - NO GOOD DUMP KNOWN
x1          : ank.fnt (8192 bytes) - NEEDS REDUMP
romset x1 is best available
1 romsets found, 1 were OK.

##########

mame pc8801 -flop1 'roms/Flappy.d88'
mame pc8801 -flop1 'roms/King_Flappy.d88'

##########

##########

mame mz800 -nojoy -cass 'roms/Flappy.mzf'

##########
</pre>
