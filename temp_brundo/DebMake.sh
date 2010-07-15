#! /bin/sh
./configure
dh_make --createorig
debuild binary
