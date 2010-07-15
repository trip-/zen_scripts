#! /bin/sh

echo ""
echo "Il link multimediale cercato è:"
echo ""
wget -O - -q `wget -O - -q "$1"|grep mediapolis|grep videoURL|cut -f2 -d'"'`| cut -f1 -d'?'|cut -f4 -d'"'
echo ""
