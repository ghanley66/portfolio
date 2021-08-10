#!/usr/bin/gnuplot

set style fill solid
set boxwidth 0.4

# Labels!
set title "Data Breaches 2018 -2022"
set ylabel "# Breaches"
set xlabel "Year"

# Rotate the labels on the x axis.
set xtics rotate
set xrange [2017:2022]

# The y axis starts at zero and ends at 120.
set yrange [0:120]

#Show Gridlines
set grid

#Get data from bar_data.dat and Plot
plot "bar_data.dat" using 1:2 \
      title "Data Breaches" \
      with boxes \

