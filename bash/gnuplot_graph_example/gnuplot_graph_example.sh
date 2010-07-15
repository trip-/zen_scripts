#! /bin/sh

# Author: Mattia Gheda
# Title: gnuplot_graph_example
# Credits: Salvatore Brundo

# Description:
# Simple example that shows a basic gnuplot usage
# Three input files are used.
# Each files has 3 useful values: TOTAL_TIME, ITERATION_NUMBER, MEAN_TIME
# two graphs are produced 

# Dependencies:
# gnuplot needs to be installed 

# License: see LICENSE 

# More infos on gnuplot
#~ http://had.fmf.uni-lj.si/~horvat/publishing/gnuplot/Kawano/gnuplot/index-e.html

export GDFONTPATH=/usr/share/fonts/freefont-ttf

total_time(){
		#set terminal png size 1000,800

		#set terminal postscript eps color font "Times-Roman,12"

		# set terminal pdf 

		#set logscale x 10
        
        # use this to move legend
        #set key right bottom

        # use this line to plot a function
		#f(x) = a*x+b
        
        # use this line for data interpolation
		#fit f(x) "rdf.txt" using 3:2 via a,b
		#f(x) title "Sensors Int" with lines, \
	echo '
		set title "# Coding-Decoding time"
		set grid
		set grid xtics ytics mxtics mytics
		set xlabel "Number of iterations"
		set ylabel "Total time (usec)"
		set terminal postscript 
		set output "foo_total.eps"
		plot "foo1.txt" using ($3):($2) title "Sensors" with lines lw 3,  \
		"foo2.txt" using ($3):($2) title "Actuators" with lines lw 3,  \
		"foo3.txt" using ($3):($2) title "Subscription" with lines lw 3 

	' | gnuplot
}


mean_time(){
echo '
		set title "Coding-Decoding time of a single interation"
		set grid
		set grid xtics ytics mxtics mytics
		set xlabel "Number of iterations"
		set ylabel "Single iteration time (usec)"
		set terminal postscript 
		set output "foo_mean.eps"
		set logscale x 10
		plot "foo1.txt" using ($3):($4) title "Sensors" with lines lw 3,  \
		"foo2.txt" using ($3):($4) title "Actuators" with lines lw 3,  \
		"foo3.txt" using ($3):($4) title "Subscription" with lines lw 3  
	' | gnuplot
}

usage(){
	echo "Gnuplot example usage:"
	echo ""
	echo "		total : graphs total time"
	echo "		mean : graphs mean time"
}

case "$1" in
'total')
	total_time
	;;
'mean')
    mean_time
	;;
*)
    usage
	;;
esac

exit 0
