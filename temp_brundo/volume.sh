#! /bin/sh
## UNA VERA MERDA!!!!!
CONTROL='Master'
OSD_CLEAN='killall osd_cat >/dev/null 2>/dev/null'
VOL_UP='amixer sset Master 2+'
VOL_DOWN='amixer sset Master 2-'

usage(){
	echo "Usage $0 {+|-|mute|unmute}"
}

osd(){
	local var=`ps -e|grep "$p"|wc -l`
	
	if [ $var -gt 0 ] 
	then
		eval $OSD_CLEAN
	fi
	
	if [ -z "$1" ]
	then
		string="Nothing to print"
	else
		string=$1
	fi
	
	if [ -z "$2" ]
	then
		delay=5
	else
		delay=$2
	fi
	
	color=red
	font=-adobe-helvetica-*-*-*-*-30-*-100-100-*-*-iso8859-*
	
	echo "$string"|osd_cat \
		--align=center \
		--pos=bottom \
		--offset=-50 \
		--color=$color \
		--delay=$delay \
		--font=$font \
		--shadow=1 & 
}

data(){
	amixer sget Master|grep Mono:
}
volume(){
	#percentage=`data|grep "$CHECK"|cut -f6 -d' '`
	percentage=`data|cut -f6 -d' '`
	#echo $percentage
	#echo $percentage | cut  -c 2-3
	
	local length=`expr length $percentage`
	
	if [ $length -eq 6 ]; then
		percentage=`echo $percentage | cut -c 2-4`
	elif [ $length -eq 5 ]; then
		percentage=`echo $percentage | cut  -c 2-3`
	elif [ $length -eq 4 ]; then
		percentage=`echo $percentage | cut  -c 2-2`
	fi
	#echo $percentage
	
}

mute_unmute(){
	local status=`data|cut -f8 -d' '`
	#echo $status
	
	if [ "$status" = "[on]" ] ; then
		amixer sset $CONTROL mute >/dev/null
		osd "Volume muted..."
	else
		amixer sset $CONTROL unmute >/dev/null
		osd_volume
	fi
}

osd_volume(){
	volume
	local var=`ps -e|grep "$p"|wc -l`
	
	if [ $var -gt 0 ] 
	then
		eval $OSD_CLEAN
	fi
	osd_cat \
		--barmode percentage\
		--align=center \
		--pos=bottom \
		--offset=+50 \
		--color=red \
		--delay=5 \
		--shadow=1 \
		--lines=1 \
		--percentage=$percentage \
		--font=-adobe-helvetica-*-i-*-*-30-*-100-100-*-*-iso8859-* \
		--text="Volume "$percentage"%" &
}

up(){
	eval $VOL_UP
	osd_volume
}

down(){
	eval $VOL_DOWN
	osd_volume
}

case "$1" in
'+' | 'up')
	up
	;;
'-' | 'down')
	down
	;;
'toggle')
	mute_unmute
	;;
'test')
	a
	;;
*)
	usage
	;;
esac

exit 0