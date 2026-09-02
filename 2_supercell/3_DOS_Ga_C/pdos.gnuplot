set terminal pngcairo size 1000,700 enhanced font "Helvetica,14"
set output "dos_tot.png"

EF =  11.8057 
dE = 0.01          # el paso de tu .pdos_tot
s  = 0.05          # ancho gaussiano en eV
set samples 4000

set xlabel "E - E_F (eV)"
set ylabel "DOS (estados/eV/celda)"
set xrange [-12:6]
set arrow from 0,graph 0 to 0,graph 1 nohead lt 0

#plot "GaN.pdos_tot" u ($1-EF):2     w l lw 2 lc rgb "red"  t "spin up", \
#     ""                    u ($1-EF):(-$3) w l lw 2 lc rgb "blue" t "spin down", \
#     

plot "GaN.pdos_tot" u ($1-EF):($2*dE)  smooth kdensity bandwidth s w l lw 2 lc rgb "red"  t "spin up", \
     ""            u ($1-EF):(-$3*dE) smooth kdensity bandwidth s w l lw 2 lc rgb "blue" t "spin down", \
"GaN.dos.dat" using ($1-EF):($2*13.5) with lines lw 3 lc rgb "black"
unset output