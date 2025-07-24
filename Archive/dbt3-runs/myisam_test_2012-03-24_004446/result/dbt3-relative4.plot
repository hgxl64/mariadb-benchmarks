#
# plot relative DBT3 result
#

reset

#output device and size
set terminal png nocrop enhanced size 1200,500
set output "dbt3-relative4.png"

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
set yrange [40:160]
set grid xtics y2tics

#legend
set key at graph 0.08, 0.72 horizontal samplen 0.2
set label 1 "MariaDB-5.3.6" at graph 0.020,0.74 left rotate by 90 front
set label 2 "MySQL-5.6.4"   at graph 0.045,0.74 left rotate by 90 front
set label 3 "MySQL-5.5.21"  at graph 0.070,0.74 left rotate by 90 front

#the plot
plot "2percents.dat" index 1 using ($2>0?$2:1000):($3):($4):xtic(1) title " ",\
     "" index 1 using ($5>0?$5:1000):($6):($7) title " ",\
     "" index 1 using ($8>0?$8:1000):($9):($10) title " "

