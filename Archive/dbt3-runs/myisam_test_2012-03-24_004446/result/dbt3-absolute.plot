#
# plot absolute DBT3 result
#

reset

set terminal png nocrop enhanced size 1280,800
set output "dbt3-absolute.png"

set boxwidth 0.9 absolute
set style fill solid 0.5 border -1
set style histogram errorbars gap 1 lw 2
set style data histograms

set xtics rotate by 90 scale 0 right
set xlabel ' '
set x2label ' '

unset ytics
set y2tics rotate by 90 center offset -1
set y2label 'Seconds' offset -4
#set grid

set key at graph 0.75,0.68 horizontal samplen 0.1
set label 1 "MariaDB-5.3.6" at graph 0.69,0.7 left rotate by 90 front
set label 2 "MySQL-5.6.4" at graph 0.715,0.7 left rotate by 90 front
set label 3 "MySQL-5.5.21" at graph 0.74,0.7 left rotate by 90 front

plot "2mariadb-5.3.6.dat" using ($2>0?$2:NaN):3:4:xtic(1) title " ",\
     "2mysql-5.6.4.dat"   using ($2>0?$2:NaN):3:4         title " ",\
     "2mysql-5.5.21.dat"  using ($2>0?$2:NaN):3:4         title " "

