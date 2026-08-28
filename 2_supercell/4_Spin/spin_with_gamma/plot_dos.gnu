reset

#---------------------------------------
# Salida
#---------------------------------------
set terminal pngcairo enhanced size 900,600
set output "DOS_total_spin.png"

#---------------------------------------
# Título y ejes
#---------------------------------------
set title "Total Density of States (projwfc.x)"
set xlabel "Energy - E_F (eV)"
set ylabel "DOS (states/eV)"

#---------------------------------------
# Apariencia
#---------------------------------------
set grid
set key top right
set border lw 1.5

#---------------------------------------
# Nivel de Fermi (cámbialo si es necesario)
#---------------------------------------
EF = 9.2462

#---------------------------------------
# Rango de energía
#---------------------------------------
set xrange [-8:8]
# set yrange [-10:10]     # Descomenta si quieres fijar el eje Y

# Línea vertical en E_F
set arrow from 0, graph 0 to 0, graph 1 nohead lw 2 dt 2 lc rgb "black"

# Línea horizontal en DOS = 0
set xzeroaxis lw 1

#---------------------------------------
# Gráfica
# Columnas:
# 1 = Energía
# 2 = DOS↑
# 3 = DOS↓
#---------------------------------------
plot \
'GaN.pdos_tot' using ($1-EF):4 with lines lw 2 lc rgb "red" title 'Spin ↑', \
'GaN.pdos_tot' using ($1-EF):(-$5) with lines lw 2 lc rgb "blue" title 'Spin ↓'

unset output
