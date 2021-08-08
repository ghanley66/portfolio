#!/usr/bin/gnuplot
# Output a png called bar_chart.png. You
# could instead leave out the output filename
# here and redirect the output to a file
# like ./myconfig.gnu > barchart.png.set terminal pngset output "barchart.png"

# Empty boxes is the default. Fill them in.
set style fill solid
# By default, adjacent boxes are extended
# in width until they touch each other. I
# want to fit two bars side by side at each
# point, and leave a little space after that, so
# I'm making the bars 0.4 units wide. (Two
# bars at 0.4 each leaves 0.2 units for space.)
set boxwidth 0.4

# Labels!
set title "Data Breaches by Year"
set ylabel "# Data Breaches"
set xlabel "Year"

# Rotate the labels on the x axis. Saves space
# and looks nice.
set xtics rotate

# Kind of hacky, but I want exactly the years in
# my file (2000 to 2006) with a tiny bit of space
# on either side.
set xrange [2017.5:2021.9]

# The y axis starts at zero and ends at 350.
set yrange [0:350]

# I like grids on graphs; it makes it easier to read.
set grid

# Now read the data from numbers.dat and plot
# the graph. 'using' takes two values: the
# position on the x axis, the position on the y
# axis. "using 1:2" means the position on the x
# axis comes from the first column in
# numbers.dat and the position on the y axis
# comes from the second column. "using 1:3"
# instead sets the y axis based on the third
# column. And so on.

# First value: use the 2nd column and draw red
# (#00FF00) boxes. Second value: use the 3rd
# column and draw green (#00FF00) boxes. But
# move the x axis over a bit.

plot "bar_data" using 1:2 \
      title "first thing" \
      with boxes \
      linecolor rgb "#FF0000", \
