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

plot 	'Etot_vs_Ecut-script.dat'  u 1:2 w lp pt 7 lw 2  lc rgb "black" title "Total energy" 
replot GPVAL_DATA_Y_MIN t "Min value" w l lt 4 dt 4 lc "red",        GPVAL_DATA_Y_MIN+thres_1mRy_per_atom w l lt 2 lc "blue" t "Min + 1mRy/atom",        GPVAL_DATA_Y_MIN+thres_10mRy_per_atom w l lt 3 lc "magenta" t "Min + 10mRy/atom"



pause -1
set term pdfcairo enhanced
set output "Etot_vs_Ecut-script.dat.pdf"
replot

reset
set term pngcairo enhanced size 800,400
set output "Etot_vs_Ecut-script.dat.png"
set xlabel "E_{cut} (Ry)"
set ylabel "E_{tot} (Ry)
thres_1mRy_per_atom=0.001*4
thres_10mRy_per_atom=0.01*4
stats 'Etot_vs_Ecut-script.dat' u 1:2 name 'EN' nooutput
set multiplot 

       set size 0.6,0.9
       set origin 0.03,0.05

plot 	'Etot_vs_Ecut-script.dat'  u 1:2 w lp pt 7 lw 2  lc rgb "black" title "Total energy",        EN_min_y t "Min value" w l lt 4 dt 4 lc "red",        EN_min_y+thres_1mRy_per_atom w l lt 2 lc "blue" t "Min + 1mRy/atom",        EN_min_y+thres_10mRy_per_atom w l lt 3 lc "magenta" t "Min + 10mRy/atom"

       set size 0.38,0.9
       set origin 0.63,0.05
set ylabel "log_{10} (E_{tot}-E_{min}) (Ry)
set xlabel "E_{cut} (Ry)"
set grid y
set autoscale y
set logscale y
set yrange [0.0001:1]
plot 	'Etot_vs_Ecut-script.dat'  u 1:($2-EN_min_y) w lp pt 7 lw 2  lc rgb "black" title "Total energy" 
set nomulti
pause -1
set term x11
set out
replot
pause -1

