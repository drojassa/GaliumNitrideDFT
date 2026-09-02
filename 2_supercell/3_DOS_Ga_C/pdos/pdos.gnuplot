set terminal pngcairo size 1000,700 enhanced font "Helvetica,14"
set output "dos_tot.png"


EF = 11.8057 
dE = 0.01          # el paso de tu .pdos_tot

plot "GaN.pdos_atm#1(C)_wfc#2(p)" u ($1-EF):($2*dE) smooth kdensity bandwidth 0.05 w l lw 2 t "C 2p up ", \
  "" u ($1-EF):($3*dE) smooth kdensity bandwidth 0.05 w l lw 2 t "C 2p down", \
     "GaN.pdos_atm#54(Ga)_wfc#2(p)" u ($1-EF):($2*dE) smooth kdensity bandwidth 0.05 w l lw 2 t "Ga 4p lejano"
#plot "GaN.pdos_atm#3(C)_wfc#2(p)" u ($1-EF):($2*dE) w l lw 2 t "C 2p up ", \
#  "" u ($1-EF):($3*dE)  w l lw 2 t "C 2p down", \
#     "GaN.pdos_atm#54(Ga)_wfc#2(p)" u ($1-EF):($2*dE) w l lw 2 t "Ga 2p lejano"

unset output