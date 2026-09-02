set terminal pngcairo size 1000,700 enhanced font "Helvetica,14"
set output "dos_breakdown.png"


EF = 11.8057 
dE = 0.01          # el paso de tu .pdos_tot
set yrange [0:10]
set xrange [-12:2]

set arrow front from 0, graph 0 to 0, graph 1 nohead lw 1 dt 2 lc rgb "green"

plot "total_pdos.dat"  u ($1-EF):($2*dE) smooth kdensity bandwidth 0.05 w filledcurves x1 lc "grey90" fc "grey90" t "total DOS ", \
"N_s.dat" u ($1-EF):($2*dE) smooth kdensity bandwidth 0.05 w l lw 2 t "N 2s ", \
"N_p.dat" u ($1-EF):($2*dE) smooth kdensity bandwidth 0.05 w l lw 2 t "N 2p ", \
"Ga_s.dat" u ($1-EF):($2*dE) smooth kdensity bandwidth 0.05 w l lw 2 t "Ga s ", \
"Ga_p.dat" u ($1-EF):($2*dE) smooth kdensity bandwidth 0.05 w l lw 2 t "Ga p ", \
"Ga_d.dat" u ($1-EF):($2*dE) smooth kdensity bandwidth 0.05 w l lw 2 t "Ga d ", \
"GaN.pdos_atm#1(C)_wfc#2(p)" u ($1-EF):($2*dE) smooth kdensity bandwidth 0.05 w l lw 2 t "C 2p ", \
"../GaN.dos.dat" u ($1-EF):($2*13.5) w l t "Pure GaN" , \

unset output