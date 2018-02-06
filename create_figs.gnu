#!/usr/bin/gnuplot

# g38
set terminal epslatex color size 14.5cm,18cm
set output 'fig/scaling38.tex'

set style line 1 lc rgb '#0060ad' pt 7 ps 0.8 lt 1 lw 2 # --- blue
set style line 2 lc rgb '#000000' pt 7 ps 0.5 lt 1 lw 2 # --- black
set style line 3 lc rgb '#aa0000' lt 2 lw 2
set style line 4 lc rgb 'blue' pt 2 ps 2 lw 3

set xlabel 'cores'
set ylabel 'time [min]'

f(x) = 19745.97 / x
g(x) = 14074.39 / x

set yrange [0:1700]
set xrange [1:900]

plot f(x) title 'ideal hyperbolas' with lines linestyle 3, \
     g(x) notitle with lines ls 3, \
     'data/g38/all_times' using 1:($2/60) title 'individual runs' with points linestyle 1, \
     'data/g38/avg_times' using 1:($2/60) title 'mean running time' with linespoints linestyle 2

set terminal epslatex color size 14.5cm,10cm
set output 'fig/efficiency38.tex'

constmean(x) = 64*14486.34
constone(x) = 1

set yrange [0.4:1.3]
set ylabel 'efficiency normalized to 64 cores'

plot constone(x) notitle with lines linestyle 2, \
     'data/g38/all_times' using 1:(constmean(x)/($1*$2)) title 'individual runs' with points linestyle 4, \
     'data/g38/avg_times' using 1:(constmean(x)/($1*$2)) title 'mean running time' with linespoints linestyle 1

# g37, one node
set terminal epslatex color size 14.5cm,18cm
set output 'fig/scaling37-1.tex'

up(x) = 832.71/x
lo(x) = 738.9/x

set multiplot layout 2, 1;

set xrange [0.5:16.5]
set yrange [0:860]
set ylabel 'time [s]'

plot up(x) title 'ideal hyperbolas' with lines linestyle 3, \
     lo(x) notitle with lines ls 3, \
     'data/g37-1/all_times' title 'individual runs' with points linestyle 1, \
     'data/g37-1/avg_times' title 'mean running time' with linespoints linestyle 2

set xrange [1.5:32.5]
set yrange [0:420]
set ylabel 'time [s]'

plot up(x) title 'ideal hyperbolas' with lines linestyle 3, \
     lo(x) notitle with lines ls 3, \
     'data/g37-2/all_times' title 'individual runs' with points linestyle 1, \
     'data/g37-2/avg_times' title 'mean running time' with linespoints linestyle 2

unset multiplot
