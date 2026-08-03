#!/usr/bin/gnuplot


set term x11 enhanced


set xlabel "Energy (eV)"
set ylabel "ɛ_1, ɛ_2"

set xrange [0:20]

set xtics 1
set mxtics 5


plot "epsilon_GaN_b22/epsi_GaN.dat" t "22 bands" w l dt 1 lc "orange","epsilon_GaN_b22/epsr_GaN.dat" t "" w l dt 4 lc "orange","epsilon_GaN_b30/epsi_GaN.dat" t "30 bands" w l dt 1 lc "red","epsilon_GaN_b30/epsr_GaN.dat" t "" w l dt 3 lw 2 lc "red","epsilon_GaN_b40/epsi_GaN.dat" t "40 bands" w l dt 1 lc "blue","epsilon_GaN_b40/epsr_GaN.dat" t "" w l dt 4 lc "blue","epsilon_GaN_b50/epsi_GaN.dat" t "50 bands" w l dt 1 lc "green","epsilon_GaN_b50/epsr_GaN.dat" t "" w l dt 4 lc "green","epsilon_GaN_b60/epsi_GaN.dat" t "60 bands" w l dt 1 lc "black","epsilon_GaN_b60/epsr_GaN.dat" t "" w l dt 4 lc "black",0 t "" w l lt 1 lc "black"


pause -1


set term pngcairo enhanced size 800,400

set output "plot_GaN_epsilon_bands.png"

replot

