
X1

https://github.com/yksoft1/xmil/tree/emscripten

MZ-800

https://sourceforge.net/projects/mz800emu/

PC-88

https://www.eonet.ne.jp/~showtime/quasi88/
http://retropc.net/pi/

BASE

wget --no-check-certificate http://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-04-09/2019-04-08-raspbian-stretch-lite.zip
umount /dev/sda1
unzip -p 2019-04-08-raspbian-stretch-lite.zip | dd of=/dev/sda bs=4M

apt-get install git vim mc
