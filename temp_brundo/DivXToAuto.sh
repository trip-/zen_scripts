#! /bin/sh
mencoder -profile 770 "$1" -o "${1/%avi/auto.avi}"
