#! /bin/sh
xrdb -load /home/salvix/.Xdefaults
xscreensaver -nosplash &
xbindkeys
sudo ifup wlan0=PD
sleep 30

synclient TouchPadOff=1
sudo mount or:/home/ramius/data /home/salvix/Network/
numlockx off
devilspie &

#smbnetfs /home/salvix/Network
#fusesmb /home/salvix/Network
#smbmount //soviet/public /home/salvix/Network
