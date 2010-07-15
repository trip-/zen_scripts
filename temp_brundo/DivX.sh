#! /bin/sh
ffmpeg -i "$1" \
	-croptop 76 \
	-cropbottom 76 \
	-cropleft 4 \
	-cropright 4  \
	-aspect 2.20 \
	-vcodec mpeg4 \
	-b 1150k \
	-r 25 \
	-s 344x156 \
	-acodec libmp3lame \
	-ab 224k \
	-ar 44100 \
	-ac 2 \
	"${1/%avi/enc.avi}"

#imposta durata in secondi dell'output
#-t 240 \ 

