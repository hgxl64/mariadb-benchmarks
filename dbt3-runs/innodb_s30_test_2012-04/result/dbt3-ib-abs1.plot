#
# plot relative DBT3 result
#

reset

#output device and size
set terminal png nocrop enhanced size 960,500 small
set output "dbt3-ib-abs1.png"

#type and plot and parameters
set boxwidth 0.9 absolute
set style fill solid 0.5 border -1
set style histogram errorbars gap 1 lw 2
set style data histograms

#x-axis
set xtics border in scale 1,0.5 nomirror
set xlabel 'Query'

#y-axis
set ylabel 'execution time [seconds]'
set yrange [ 0. : 5600. ] noreverse nowriteback

set grid
set key below right
set title "MariaDB-5.5.23 vs. MySQL-5.6.5 with exact statistics"


#the plot
plot "summary_maria_vs_mysql.dat" index 0 using ($3>0?$3:NaN):2:4:xtic(1) title "MariaDB-5.5.23",\
     "" index 0 using ($6>0?$6:NaN):5:7 title "MySQL-5.6.5-m8"
