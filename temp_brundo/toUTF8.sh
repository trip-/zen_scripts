#! /bin/sh

iconv -f=ISO_8859-15 -t=UTF8 "$1" >"$1.temp"
mv "$1.temp" "$1"
echo "Convertito file $1"
