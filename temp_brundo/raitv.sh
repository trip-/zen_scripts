#!/bin/sh
# Copyright (c) 2007 Timothy Redaelli <tredaelli@inventati.org>
# Distributed under the terms of the GNU General Public License v2
# $Id$
#
# Usage: ./raitv.sh <url>

PATHXMLMEDIA="/mpXMLforPlayer/0,,"
PATHXMLWEBTV="/mpXMLforWebTV/0,,"
USERAGENT="Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0)"

if type curl > /dev/null 2>&1; then
	FETCH="curl -s -A '$USERAGENT'"
elif type wget > /dev/null 2>&1; then
	FETCH="wget -q -O- -U '$USERAGENT'"
elif type fetch > /dev/null 2>&1; then
	FETCH="fetch -o-"
fi

RAIURI=$(echo "$1" | sed 's|^\(http://[^/]*\).*$|\1|')
# AjaxMedias.js
XML=$($FETCH "$1" | sed "s/'//g" | awk -F "[(,)]" -v "raiUri=$RAIURI" -v "pathXmlMedia=$PATHXMLMEDIA" -v "pathXmlWebTV=$PATHXMLWEBTV" \
    '/Get_RAIPlaylistMedia/{
    	raiMedia=$2; ObjectType=$3; tipoConfigurazione=$4; tipoDistribuzione=$5; tipoPlaylist=$6;
    	print raiUri pathXmlMedia raiMedia "^" ObjectType "^" tipoConfigurazione "^" tipoDistribuzione "^" tipoPlaylist ",00.html"
    }
    /Get_RAIPlaylistPali/{
    	raiChannel=$2; tipoConfigurazione=$3; tipoDistribuzione=$4; tipoPlaylist=$5;
	print raiUri pathXmlWebTV raiChannel "^" tipoConfigurazione "^" tipoDistribuzione "^" tipoPlaylist ",00.html" 
    }')

URL=$($FETCH "${XML:-$1}" | sed -n -e 's|^.*<link>\(.*\)</link>.*$|\1|p' -e 's/.*<PARAM NAME="URL" VALUE="\([^"]*\)".*$/\1/p' | fgrep -v 'http://www.banneradmin.rai.it/' ) 

echo "$URL"
