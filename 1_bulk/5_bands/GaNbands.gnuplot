set title "GaN band structure from GaNbands.dat.gnu"
#     high-symmetry point:  0.0000 0.0000 0.3067   x coordinate   0.0000
#     high-symmetry point:  0.5000 0.2887 0.3067   x coordinate   0.5774
#     high-symmetry point:  0.5000 0.2887 0.0000   x coordinate   0.8840
#     high-symmetry point:  0.0000 0.0000 0.0000   x coordinate   1.4614
#     high-symmetry point:  0.0000 0.0000 0.3067   x coordinate   1.7680
#     high-symmetry point:  0.3333 0.5774 0.3067   x coordinate   2.4347
#     high-symmetry point:  0.3333 0.5774 0.0000   x coordinate   2.7414
#     high-symmetry point:  0.0000 0.0000 0.0000   x coordinate   3.4080
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
#set yrange [-13:4]
set grid x
set ylabel "Energy (eV)"
set nokey
EF =9.2462
set term post enhanced
set out "GaNbands-nosym.ps"
plot "GaNbands.dat.gnu" u 1:($2-EF) with linespoints pointtype 7 pointsize 0.5,\
	0 t "" w l lt 2
set term pngcairo
set out "GaNbands-nosym.png"
replot
set term dumb size 120,40
set out 
replot
set term x11
set out
replot
