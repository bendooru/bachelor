#!/usr/bin/gnuplot

set terminal epslatex color size 15cm,10cm
set output 'fig/scaling.tex'

set style line 1 lc rgb '#0060ad' pt 7 ps 0.8 lt 1 lw 2 # --- blue
set style line 2 lc rgb '#000000' pt 7 ps 0.5 lt 1 lw 2 # --- black
set style line 3 lc rgb '#aa0000' lt 2 lw 2
set style line 4 lc rgb 'blue' pt 2 ps 2 lw 3

set xlabel 'threads'
set ylabel 'time [min]'

f(x) = 12531.7 / x
g(x) = 14010.37 / x

set yrange [0:600]
set xrange [1:900]

plot f(x) title 'ideal hyperbolas' with lines linestyle 3, \
     g(x) notitle with lines ls 3, \
     'data/all_times' using 1:($2/60) title 'individual runs' with points linestyle 1, \
     'data/avg_times' using 1:($2/60) title 'mean running time' with linespoints linestyle 2

set output 'fig/efficiency.tex'

constmean(x) = 64*13134.723
constone(x) = 1

set yrange [0.8:1.6]
set ylabel 'efficiency normalized to 32 threads'

plot constone(x) notitle with lines linestyle 2, \
     'data/all_times' using 1:($1*$2/constmean(x)) title 'individual runs' with points linestyle 4
