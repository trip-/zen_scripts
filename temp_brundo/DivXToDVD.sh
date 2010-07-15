#! /bin/sh
INFILE=$1
ASPECT=4/3

mencoder \
	-oac copy \
	-ovc lavc \
	-of mpeg \
	-mpegopts format=dvd \
	-vf scale=720:576,harddup \
	-lavcopts vcodec=mpeg2video:vrc_buf_size=1835:vrc_maxrate=9800:vbitrate=5000:keyint=15:aspect=$ASPECT \
	-ofps 25 \
	-o $INFILE.mpg \
	$INFILE
