#! /bin/sh

/home/salvix/Software/Script/amv-ffmpeg	-i "$1" \
	-f amv \
	-s 128x96 \
	-r 15 \
	-qmin 3 \
	-qmax 3 \
	-mbd 2 \
	-g 1 \
	-ac 1 \
	-ar 22050 \
	"${1/%avi/amv}"
