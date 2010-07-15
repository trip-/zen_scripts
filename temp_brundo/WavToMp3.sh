#! /bin/sh
#ffmpeg -i "$1" -ar 44100 -ab 160k -ac 2 "$1".mp3  
ffmpeg \
	-i "$1"\
	-vn\
	-ar 44100\
	-ac 2\
	-ab 192\
	-f mp3\
	"$1".mp3