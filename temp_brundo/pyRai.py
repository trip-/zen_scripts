#! /usr/bin/python
# -*- coding: iso-8859-15 -*-

# %253A :
#%252F /
#%255E .

#ES LINK:
#Pagina WEB:
#http://www.rai.tv/mpplaymedia/0,,RaiDue-Annozero-Puntate%5E17%5E38734,00.html
#Link mms:
#mms://rntlivewm.rai.it/raidue/annozero/puntata251007.wmv
#regexp = (mms://).*(wmv)

import sys
import os
import urllib
import re

def print_help():
	print '**********************************************'
	print '*                 pyRai                      *'
	print '*  Tool per estrarre i link multimediali     *'
	print '*          dal sito della Rai                *'
	print '**********************************************'
	print '  Uso:'
	print '  pyRai url	estrae link multimediali in url'
	print '  pyRai -h	questo help'
	print '  pyRai -v	versione'
	sys.exit(0)

def print_version():
	version = "0.01"
	author = "Salvatore Brundo - salvo85@gmail.com"
	print '**********************************************'
	print '*                 pyRai                      *'
	print '*  Tool per estrarre i link multimediali     *'
	print '*          dal sito della Rai                *'
	print '**********************************************'
	print '  pyRai', version
	print '  autore:', author
	sys.exit(0)

if (len(sys.argv)  == 1 or len(sys.argv) > 2):
	print_help()
	sys.exit(0)

elif (sys.argv[1] == '-h' or sys.argv[1] == '-help'):
	print_help()
	sys.exit(0)

elif (sys.argv[1] == '-v' or sys.argv[1] == '-version'):
	print_version()
	sys.exit(0)

else:
	print 'Sto estraendo i link multimediali dal sito:',
	print sys.argv[1],
	print '...'
	try:
		f = urllib.urlopen(sys.argv[1])
	except IOError:
		print sys.argv[1], 
		print 'è un url non valido!!',
		print 'Impossibile proseguire!!'
		sys.exit(0)
	data = []
	#Questa è l'espressione regolare di default:
	#regexp = 'mms.*wmv'
	#queste è la regexp modificata
	regexp = 'http.*mediapolis.*cont%253D.*EEqual'
	s = re.compile(regexp)
	for line in f:
		print data
		data += s.findall(line)
	link = data[0]
	link = link.replace('%253A',':')
	link = link.replace('%252F','/')
	link = link.replace('%255E' ,'.')
	link = link.replace('%253D','=')
	link = link.replace('%253F','?')
	print 'Il link multimediale è:',link
	s = link.split('/')
	filename = s[len(s) - 2]+'_'+ s[len(s) - 1]
	command = 'mplayer -playlist '+link+' -dumpstream -dumpfile '+'StreamVideo.avi'
	print 'Eseguo:',command
#	os.system(command)
