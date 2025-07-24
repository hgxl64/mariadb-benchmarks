#
# plot relative DBT3 result
#

reset

#output device and size
set terminal png nocrop enhanced size 960,500 small
set output "dbt3-ib-rel3.png"

#type and plot and parameters
set boxwidth 0.9 absolute
set style fill solid 0.5 border -1
set style histogram errorbars gap 1 lw 2
set style data histograms

#x-axis
set xtics border in scale 1,0.5 nomirror
set xlabel 'Query'

#y-axis
set ylabel 'relative execution time [percent]'
set yrange [ 0. : 300. ] noreverse nowriteback

set grid
set key below right
set title "MySQL-5.6.5 with different statistics"


#the plot
plot "summary_mysql.dat" index 1 using ($3>0?$3:999):2:4:xtic(1) title "exact stats",\
     "" index 1 using ($6>0?$6:999):5:7 title "persistent stats",\
     "" index 1 using ($9>0?$9:999):8:10 title "default stats"

