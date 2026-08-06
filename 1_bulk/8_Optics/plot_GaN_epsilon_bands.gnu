#!/usr/bin/gnuplot

set term x11 enhanced size 800,700

set multiplot layout 2,1 title "GaN dielectric function"

set xrange [0:20]
set xtics 1
set mxtics 5

#-------------------------
# Parte real (epsilon_1)
#-------------------------
set xlabel ""
set ylabel "{/Symbol e}_1"
set key top right

plot "epsilon_GaN_b22/epsr_GaN.dat" t "22 bands" w l dt 4 lc "orange","epsilon_GaN_b30/epsr_GaN.dat" t "30 bands" w l dt 3 lw 2 lc "red","epsilon_GaN_b40/epsr_GaN.dat" t "40 bands" w l dt 4 lc "blue","epsilon_GaN_b50/epsr_GaN.dat" t "50 bands" w l dt 4 lc "green","epsilon_GaN_b60/epsr_GaN.dat" t "60 bands" w l dt 4 lc "black",0 t "" w l lc "black"

#-------------------------
# Parte imaginaria (epsilon_2)
#-------------------------
set xlabel "Energy (eV)"
set ylabel "{/Symbol e}_2"

plot "epsilon_GaN_b22/epsi_GaN.dat" t "22 bands" w l dt 1 lc "orange","epsilon_GaN_b30/epsi_GaN.dat" t "30 bands" w l dt 1 lc "red","epsilon_GaN_b40/epsi_GaN.dat" t "40 bands" w l dt 1 lc "blue","epsilon_GaN_b50/epsi_GaN.dat" t "50 bands" w l dt 1 lc "green","epsilon_GaN_b60/epsi_GaN.dat" t "60 bands" w l dt 1 lc "black",0 t "" w l lc "black"

unset multiplot

pause -1

#---------------------------------
# Guardar en PNG
#---------------------------------
set term pngcairo enhanced size 800,700
set output "plot_GaN_epsilon_bands.png"

set multiplot layout 2,1 title "GaN dielectric function"

set xrange [0:20]
set xtics 1
set mxtics 5

set xlabel ""
set ylabel "{/Symbol e}_1"
set key top right

plot "epsilon_GaN_b22/epsr_GaN.dat" t "22 bands" w l dt 4 lc "orange","epsilon_GaN_b30/epsr_GaN.dat" t "30 bands" w l dt 3 lw 2 lc "red","epsilon_GaN_b40/epsr_GaN.dat" t "40 bands" w l dt 4 lc "blue","epsilon_GaN_b50/epsr_GaN.dat" t "50 bands" w l dt 4 lc "green","epsilon_GaN_b60/epsr_GaN.dat" t "60 bands" w l dt 4 lc "black",0 t "" w l lc "black"

set xlabel "Energy (eV)"
set ylabel "{/Symbol e}_2"

plot "epsilon_GaN_b22/epsi_GaN.dat" t "22 bands" w l dt 1 lc "orange","epsilon_GaN_b30/epsi_GaN.dat" t "30 bands" w l dt 1 lc "red","epsilon_GaN_b40/epsi_GaN.dat" t "40 bands" w l dt 1 lc "blue","epsilon_GaN_b50/epsi_GaN.dat" t "50 bands" w l dt 1 lc "green","epsilon_GaN_b60/epsi_GaN.dat" t "60 bands" w l dt 1 lc "black",0 t "" w l lc "black"

unset multiplot

