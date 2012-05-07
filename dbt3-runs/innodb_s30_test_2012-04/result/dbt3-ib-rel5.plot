#
# plot relative DBT3 result, for rotation 90° cw
#

reset

#output device and size
set terminal png nocrop enhanced size 900,500
set output "dbt3-ib-rel5.png"

#type and plot and parameters
set boxwidth 0.9 absolute
set style fill solid 0.5 border -1
set style histogram errorbars gap 1 lw 2
set style data histograms

#x-axis
set xtics rotate by 90 scale 0 right
set xlabel ' '
set x2label ' '

#y-axis
unset ytics
set y2tics rotate by 90 center
set y2label 'execution time in percent of MariaDB median' offset -1
set yrange [0:300]
set grid xtics y2tics

#legend
set key at graph 0.07, 0.72 horizontal samplen 0.2
set label 1 "MariaDB-5.5.23" at graph 0.023,0.74 left rotate by 90 front
set label 2 "MySQL-5.6.5"    at graph 0.056,0.74 left rotate by 90 front

#the plot
plot "summary.dat" index 1 using ($3>0?$3:1000):2:4:xtic(1) title " ",\
     "" index 1 using ($6>0?$6:1000):5:7 title " "

