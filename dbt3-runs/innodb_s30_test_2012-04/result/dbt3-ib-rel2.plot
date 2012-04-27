#
# plot relative DBT3 result
#

reset

#output device and size
set terminal png nocrop enhanced size 960,500 small
set output "dbt3-ib-rel2.png"

#type and plot and parameters
set boxwidth 0.9 absolute
set style fill solid 0.5 border -1
set style histogram errorbars gap 1 lw 2
set style data histograms

#x-axis
set xtics border in scale 1,0.5 nomirror
set xlabel 'Query'

#y-axis
set ylabel 'relative execution time [percent of InnoDB]'
set yrange [ 0. : 300. ] noreverse nowriteback

set grid
set key below right
set title "MariaDB-5.5.23/InnoDB vs. MariaDB-5.3.6/MyISAM"


#the plot
plot "summary_innodb_vs_myisam.dat" index 1 using ($3>0?$3:NaN):2:4:xtic(1) title "InnoDB",\
     "" index 1 using ($6>0?$6:NaN):5:7 title "MyISAM"
