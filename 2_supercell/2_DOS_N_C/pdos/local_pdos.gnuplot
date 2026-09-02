set terminal pngcairo size 1000,700 enhanced font "Helvetica,14"
set output "dos_local_tot.png"


EF = 9.3346
dE = 0.01          # el paso de tu .pdos_tot

plot "GaN.pdos_atm#3(C)_wfc#2(p)" u ($1-EF):($2*dE) smooth kdensity bandwidth 0.05 w l lw 2 t "C 2p ", \
     "GaN.pdos_atm#56(N)_wfc#2(p)" u ($1-EF):($2*dE) smooth kdensity bandwidth 0.05 w l lw 2 t "N 2p bulk", \
     "GaN.pdos_atm#7(N)_wfc#2(p)" u ($1-EF):($2*dE) smooth kdensity bandwidth 0.05 w l lw 2 t "N 2p close neighbor", \
     "GaN.pdos_atm#6(Ga)_wfc#2(p)" u ($1-EF):($2*dE) smooth kdensity bandwidth 0.05 w l lw 2 t "Ga 4p close neighbor", \
      "GaN.pdos_atm#54(Ga)_wfc#2(p)" u ($1-EF):($2*dE) smooth kdensity bandwidth 0.05 w l lw 2 t "Ga 4p bulk", 

unset output