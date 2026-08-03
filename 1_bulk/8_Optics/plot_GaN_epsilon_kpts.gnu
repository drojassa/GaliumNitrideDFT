#!/usr/bin/gnuplot

set term x11 enhanced

set title "GaN dielectric function - k-point convergence"

set xlabel "Energy (eV)"
set ylabel "ε₁, ε₂"

set xrange [0:20]
set xtics 2
set mxtics 2

plot "epsilon_GaN_k4x4x3/epsi_GaN.dat"      t "4×4×3"      w l dt 1 lc "orange", "epsilon_GaN_k4x4x3/epsr_GaN.dat"      t ""           w l dt 4 lc "orange", "epsilon_GaN_k8x8x6/epsi_GaN.dat"      t "8×8×6"      w l dt 1 lc "red", "epsilon_GaN_k8x8x6/epsr_GaN.dat"      t ""           w l dt 3 lw 2 lc "red", "epsilon_GaN_k12x12x9/epsi_GaN.dat"    t "12×12×9"    w l dt 1 lc "blue", "epsilon_GaN_k12x12x9/epsr_GaN.dat"    t ""           w l dt 4 lc "blue", "epsilon_GaN_k16x16x12/epsi_GaN.dat"   t "16×16×12"   w l dt 1 lc "black", "epsilon_GaN_k16x16x12/epsr_GaN.dat"   t ""           w l dt 4 lc "black", "epsilon_GaN_k20x20x15/epsi_GaN.dat"   t "20×20×15"   w l dt 1 lc "dark-green", "epsilon_GaN_k20x20x15/epsr_GaN.dat"   t ""           w l dt 4 lc "dark-green", "epsilon_GaN_k24x24x18/epsi_GaN.dat"   t "24×24×18"   w l dt 1 lc "violet", "epsilon_GaN_k24x24x18/epsr_GaN.dat"   t ""           w l dt 4 lc "violet", "epsilon_GaN_k28x28x21/epsi_GaN.dat"   t "28×28×21"   w l dt 1 lc "brown", "epsilon_GaN_k28x28x21/epsr_GaN.dat"   t ""           w l dt 4 lc "brown", "epsilon_GaN_k32x32x24/epsi_GaN.dat"   t "32×32×24"   w l dt 1 lc "cyan", "epsilon_GaN_k32x32x24/epsr_GaN.dat"   t ""           w l dt 4 lc "cyan", 0 t "" w l lt 1 lc "black"

pause -1

set term pngcairo enhanced size 1200,600
set output "plot_GaN_epsilon_kpts.png"

replot

