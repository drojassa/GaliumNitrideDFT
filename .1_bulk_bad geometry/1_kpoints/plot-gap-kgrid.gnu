#!/usr/bin/gnuplot

# Setup terminal for screen visualization
set term x11 enhanced

set xlabel "N (NxNxN k-point mesh)"
set ylabel "Energy Gap (eV)"

# Adjust margins slightly so that labels on the edges do not get cut off
set offset graph 0.05, graph 0.05, graph 0.05, graph 0.05

# Plotting both data files:
# Column 1 = Grid size (X axis)
# Column 5 = Calculated Gap in eV (Y axis)
# Column 2 = Total number of K-points (used for the floating labels)
plot 	'Gap_vs_kgrid-script.dat0' u 1:5 w lp pt 7 lw 2 lc rgb "blue" title "Gap vs NxNxN 000",	'Gap_vs_kgrid-script.dat0' u 1:5:2 w labels offset char 1,1 textcolor rgb "blue" notitle,	'Gap_vs_kgrid-script.dat1' u 1:5 w lp pt 7 lw 2 lc rgb "red" title "Gap vs NxNxN 111",	'Gap_vs_kgrid-script.dat1' u 1:5:2 w labels offset char 1,-1 textcolor rgb "red" notitle

pause -1

# Save as PDF
set term pdfcairo enhanced
set output "Gap_vs_kgrid-script.dat.pdf"
replot

# Save as PNG
set term pngcairo enhanced size 800,600
set output "Gap_vs_kgrid-script.dat.png"
replot
