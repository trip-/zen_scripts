#! /bin/sh

# Dimensione consigliata: 320x240 (aspect 4:3)
# Dimensione decente: 160x120 (aspect 4:3)
# -t durata in secondi per test
# Sempre paddare!!! per video con ratio diverso!
# 320xH (in H di aspect devono essere esclusi i valori paddati!!!!)

ffmpeg	-i "$1" \
	-f mp4 \
	-vcodec mpeg4 \
	-maxrate 1000 \
	-b 700 \
	-qmin 3 \
	-qmax 5 \
	-bufsize 4096 \
	-g 300 \
	-acodec libfaac \
	-ab 64 \
	-ar 48000 \
	-s 320x204 \
	-padtop 18 \
	-padbottom 18 \
	-aspect 4:3 \
	"$1".mp4
#	${1/%avi/mp4}
