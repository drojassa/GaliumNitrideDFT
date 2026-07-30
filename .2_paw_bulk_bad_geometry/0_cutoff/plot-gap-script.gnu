#!/usr/bin/gnuplot

set xlabel "E_{cut} (Ry)"
set ylabel "E (eV)

# Generate a PDF image
set term pdfcairo enhanced
set output "Gap_vs_Ecut-script.dat.pdf"
set multiplot layout 1,2
plot 	'Gap_vs_Ecut-script.dat'  u 1:3 w lp pt 7 lw 2  lc rgb "red" title "CBM",	'Gap_vs_Ecut-script.dat'  u 1:2 w lp pt 6 lw 2  lc rgb "blue" title "VBM"
plot 	'Gap_vs_Ecut-script.dat'  u 1:4 w lp pt 5 lw 2  lc rgb "black" title "Gap"
set nomulti

# Generate a PNG image (useful for GitHub)
set term pngcairo enhanced size 800,400
set output "Gap_vs_Ecut-script.dat.png"
set multiplot layout 1,2
plot 	'Gap_vs_Ecut-script.dat'  u 1:3 w lp pt 7 lw 2  lc rgb "red" title "CBM",	'Gap_vs_Ecut-script.dat'  u 1:2 w lp pt 6 lw 2  lc rgb "blue" title "VBM"
plot 	'Gap_vs_Ecut-script.dat'  u 1:4 w lp pt 5 lw 2  lc rgb "black" title "Gap"
set nomulti
replot

# Plot onscreen just the gap.
# x11 should work on most system. Try wxt (ubuntu) or aqua (mac) for nicer plots.
set term x11 enhanced
set out
plot 	'Gap_vs_Ecut-script.dat'  u 1:4 w lp pt 5 lw 2  lc rgb "black" title "Gap"
replot
pause -1
