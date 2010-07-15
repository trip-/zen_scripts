#! /bin/sh
## UNA VERA MMERDA!!!!!

OSD_CLEAN='killall osd_cat >/dev/null 2>/dev/null'
usage(){
	echo "Usage $0 {toggle|next|prev}"
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

current(){
	current_song=`mpc|head -1`
}

is_playing(){
	local play=`mpc | grep paused`
	if [ -z "$play" ] 
	then
		return 1
	else
		return 0
	fi
}

current

toggle(){
	is_playing
	local is_playing=$?
	if [ $is_playing -eq 1 ] 
	then
		eval $OSD_CLEAN
		osd "MPD stopped"
		mpc toggle
	else
		eval $OSD_CLEAN
		osd "MPD started:  $current_song"
		mpc toggle
	fi
}

case "$1" in
'toggle')
	toggle
	;;
'next')
	mpc next
	current
	eval $OSD_CLEAN
	osd "MPD n: $current_song"
	;;
'prev')
	mpc prev
	current
	eval $OSD_CLEAN
	osd "MPD p: $current_song"
	;;
*)
	usage
	;;
esac

exit 0