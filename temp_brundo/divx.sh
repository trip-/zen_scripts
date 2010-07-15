#!/bin/sh

ffmpeg -i $1 \
	-vcodec mpeg4 \
	-acodec copy \
	-s 706x300 \
	-b 790000 \
	-aspect 2.35\
	${1/%avi/encoded.avi}
