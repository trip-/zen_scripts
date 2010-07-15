#! /bin/sh

COD=`freevo imdb -s "$1" | tail -n1 - | grep -o "[0-9]* "`
freevo imdb $COD "$1" "$1.avi"
