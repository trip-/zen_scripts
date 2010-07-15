#! /bin/sh 
ffmpeg -i $1 -acodec copy -vcodec copy outfile.avi
