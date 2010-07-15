#! /bin/sh
ON='synclient TouchpadOff=0'
OFF='synclient TouchpadOff=1'

usage(){
	echo "Usage $0 {on|off|toggle}"
}

touchpad_status(){
	ts=`synclient -l|grep TouchpadOff|cut -c 28-29`
}

mouse_status(){
	mouse=`lsusb |grep "Holtek"|wc -l`
}

on(){
	eval $ON
}

off(){
	eval $OFF
}

toggle(){
	touchpad_status
	if [ $ts -eq 0 ]; then
		off
	else
		on
	fi
}

mouse(){
	mouse_status
	if [ $mouse -eq 0 ]; then
		on
	else
		off
	fi
}

case "$1" in
'on' | 'start')
	on
	;;
'off' | 'stop')
	off
	;;
'toggle')
	toggle
	;;
'mouse')
	mouse
	;;
*)
	usage
	;;
esac

exit 0