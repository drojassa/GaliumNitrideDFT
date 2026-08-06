#set title "Si band structure from Sibands.dat.gnu"
set title ""

A=0.0000
L=0.5774
M=0.8840
G=1.4614
A2= 1.7680
H= 2.4347
K= 2.7414
G2=3.4080
set xtics ("A" A,"L" L, "M" M, "{/Symbol G}" G,"A" A2,"H" H,"K" K,"{/Symbol G}" G2) nomirror
set xrange [*:*]
set yrange [-8:8]
set grid x
set grid y
set ylabel "Energy (eV)"
set nokey
EF = 6.377
VBM = 9.2462
set term pngcairo
set out "GaNbands_DOS.png"
set multiplot layout 1,2
set format y "%3.1f"
set rmargin at screen 0.6
plot "GaNbands.dat.gnu" u 1:($2-VBM) with lines,\
	0 t "" w l lt 2
set ylabel ""
set format y ""
set xtics auto
set format x "%g"
set lmargin at screen 0.63
set rmargin at screen 0.95
unset grid 
set grid y
set xrange [0:4.5]
plot "GaN.dos.dat" u 2:($1-VBM) with filledcurves y1 lc "red" fc "red"
set nomulti
replot
