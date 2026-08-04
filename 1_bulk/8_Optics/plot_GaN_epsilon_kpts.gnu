#!/usr/bin/gnuplot

set terminal x11 enhanced size 900,900

set multiplot layout 2,1 title "GaN dielectric function - k-point convergence"

###############################################################
# Parte real
###############################################################

set title "Real part (ε₁)"
set xlabel ""
set ylabel "ε₁"

set xrange [0:20]
set xtics 2
set mxtics 2
set key outside right

plot "epsilon_GaN_k4x4x3/epsr_GaN.dat"      t "4×4×3"      w l lw 2, "epsilon_GaN_k8x8x6/epsr_GaN.dat"      t "8×8×6"      w l lw 2, "epsilon_GaN_k12x12x9/epsr_GaN.dat"    t "12×12×9"    w l lw 2, "epsilon_GaN_k16x16x12/epsr_GaN.dat"   t "16×16×12"   w l lw 2, "epsilon_GaN_k20x20x15/epsr_GaN.dat"   t "20×20×15"   w l lw 2, "epsilon_GaN_k24x24x18/epsr_GaN.dat"   t "24×24×18"   w l lw 2, "epsilon_GaN_k28x28x21/epsr_GaN.dat"   t "28×28×21"   w l lw 2, "epsilon_GaN_k32x32x24/epsr_GaN.dat"   t "32×32×24"   w l lw 2

###############################################################
# Parte imaginaria
###############################################################

set title "Imaginary part (ε₂)"
set xlabel "Energy (eV)"
set ylabel "ε₂"

set xrange [0:20]
set xtics 2
set mxtics 2

plot "epsilon_GaN_k4x4x3/epsi_GaN.dat"      t "4×4×3"      w l lw 2, "epsilon_GaN_k8x8x6/epsi_GaN.dat"      t "8×8×6"      w l lw 2, "epsilon_GaN_k12x12x9/epsi_GaN.dat"    t "12×12×9"    w l lw 2, "epsilon_GaN_k16x16x12/epsi_GaN.dat"   t "16×16×12"   w l lw 2, "epsilon_GaN_k20x20x15/epsi_GaN.dat"   t "20×20×15"   w l lw 2, "epsilon_GaN_k24x24x18/epsi_GaN.dat"   t "24×24×18"   w l lw 2, "epsilon_GaN_k28x28x21/epsi_GaN.dat"   t "28×28×21"   w l lw 2, "epsilon_GaN_k32x32x24/epsi_GaN.dat"   t "32×32×24"   w l lw 2

unset multiplot

pause -1

set terminal pngcairo enhanced size 1000,1200
set output "plot_GaN_epsilon_kpts.png"
replot

