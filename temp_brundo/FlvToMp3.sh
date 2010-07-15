#! /bin/sh
ffmpeg -i "$1" -ar 44100 -ab 160k -ac 2 "$1".mp3  
