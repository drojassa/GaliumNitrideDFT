reset

set terminal pngcairo enhanced size 900,600
set output "DOS_kpoints.png"

set title "DOS using tetrahedron method"

set xlabel "Energy - E_F (eV)"
set ylabel "DOS (states/eV)"

set grid
set key top left

EF = 9.2462

# Energía alrededor del nivel de Fermi
set xrange [-8:8]
set yrange [0:8]

# Línea vertical indicando E_F
set arrow from 0, graph 0 to 0, graph 1 nohead lw 2 dt 2

plot \
'4x4x3_tetra/GaN.dos.dat'     using ($1-EF):2 with lines lw 2 title '4x4x3', \
'8x8x6_tetra/GaN.dos.dat'     using ($1-EF):2 with lines lw 2 title '8x8x6', \
'16x16x12_tetra/GaN.dos.dat'  using ($1-EF):2 with lines lw 2 title '16x16x12', \
'24x24x18_tetra/GaN.dos.dat'  using ($1-EF):2 with lines lw 2 title '24x24x18', \
'32x32x24_tetra/GaN.dos.dat'  using ($1-EF):2 with lines lw 2 title '32x32x24'
