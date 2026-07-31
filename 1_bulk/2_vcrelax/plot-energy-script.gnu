#!/usr/bin/gnuplot

# x11 should work on any system
# try wxt (ubuntu) or aqua (mac) for nicer plots
reset
set term x11 enhanced
set out

set xlabel "E_{cut} (Ry)"
set ylabel "E_{tot} (Ry)
thres_1mRy_per_atom=0.001*4
thres_10mRy_per_atom=0.01*4

plot 	'GaN_Etot_vs_vc-relax-script.dat'  u 1:5 w lp pt 7 lw 2  lc rgb "black" title "Total energy" 
replot GPVAL_DATA_Y_MIN t "Min value" w l lt 4 dt 4 lc "red",        GPVAL_DATA_Y_MIN+thres_1mRy_per_atom w l lt 2 lc "blue" t "Min + 1mRy/atom",        GPVAL_DATA_Y_MIN+thres_10mRy_per_atom w l lt 3 lc "magenta" t "Min + 10mRy/atom"



pause -1
set term pngcairo enhanced
set output "GaN_Etot_vs_vc-relax-script.dat.png"
replot
