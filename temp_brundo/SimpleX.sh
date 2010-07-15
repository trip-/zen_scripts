#! /bin/sh
#sh .fehbg
nitrogen --restore &
devilspie &
xbindkeys
#smbmount //soviet/public Network/ -o guest
fusesmb /home/salvix/Network
numlockx off
touch.sh mouse
xscreensaver -no-splash &
#tint &
#stalonetray &
fbpanel &
conky &
wbar -jumpf 0 -pos left -vbar -bpress -nanim 3 -zoomf 2 -idist 4
