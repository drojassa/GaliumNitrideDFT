#!/usr/bin/gnuplot

set term x11 enhanced

set xlabel "N (NxNxN k-point mesh)"
set ylabel "E_{tot} (Ry)"

plot 	'Etot_vs_kgrid-script.dat0'  u 1:3 w lp pt 7 lw 2  lc rgb "black" title "E vs NxNxN 000",	'Etot_vs_kgrid-script.dat0'  u 1:3:2 w labels offset char 1,1 notitle,	'Etot_vs_kgrid-script.dat1'  u 1:3 w lp pt 7 lw 2  lc rgb "red" title "E vs NxNxN 111",	'Etot_vs_kgrid-script.dat1'  u 1:3:2 w labels offset char 1,-1 notitle,       -612.42737677+(0.001*4) w l lt 1 dt 2 lc "green" t "+1 mRy/atom",      -612.42737677-(0.001*4) w l lt 1 dt 2 lc "green" t "-1 mRy/atom"
pause -1
set term pdfcairo enhanced
set output "Etot_vs_kgrid-script.dat.pdf"
replot
set term pngcairo enhanced
set output "Etot_vs_kgrid-script.dat.png"
replot
