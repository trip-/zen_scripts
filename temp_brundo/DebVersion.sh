#! /bin/sh
#Pulizia rc dpkg
#dpkg --purge `dpkg -l|grep -v ii|grep rc|grep -v Err?|cut -d' ' -f3`

total=`dpkg -l|wc -l`
t_ver=`apt-show-versions |wc -l`
t_stable=`apt-show-versions|grep /stable|wc -l`
t_testing=`apt-show-versions|grep /testing|wc -l`
t_unstable=`apt-show-versions|grep /unstable|wc -l`
t_unver=`apt-show-versions |grep -v /stable|grep -v /testing|grep -v /unstable|wc -l`
t_notii=`dpkg -l|grep -v ii|grep rc|grep -v Err?|wc -l`
t_agg=`apt-show-versions -u|wc -l`
echo ""
echo "DebCounter"
echo "****************************************"
echo "Totale pacchetti su `uname -n`:" $total
echo "	Classificabili:" $t_ver
echo "	Stable:" $t_stable
echo "	Testing:" $t_testing
echo "	Unstable:" $t_unstable
echo " 	Non riconosciuti:" $t_unver
echo "	Aggiornabili:" $t_agg
echo "	Installazione non completa:" $t_notii
