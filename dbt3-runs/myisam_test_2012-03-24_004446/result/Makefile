all: fixed

fixed: dbt3-abs1.png dbt3-rel1.png dbt3-rel2.png dbt3-rel3.png dbt3-rel4.png dbt3-rel5.png

current: current.plot
	gnuplot -p current.plot
	touch current

#------ fixed targets --------

dbt3-absolute.png: dbt3-absolute.plot 2mariadb-5.3.6.dat 2mysql-5.5.21.dat 2mysql-5.6.4.dat
	gnuplot dbt3-absolute.plot

dbt3-relative.png: dbt3-relative.plot 2percents.dat
	gnuplot dbt3-relative.plot

dbt3-relative2.png: dbt3-relative2.plot 2percents.dat
	gnuplot dbt3-relative2.plot

dbt3-relative3.png: dbt3-relative3.plot 2percents.dat
	gnuplot dbt3-relative3.plot

dbt3-relative4.png: dbt3-relative4.plot 2percents.dat
	gnuplot dbt3-relative4.plot

dbt3-relative5.png: dbt3-relative5.plot 2percents.dat
	gnuplot dbt3-relative5.plot

dbt3-rel1.png: dbt3-relative.png
	pngtopnm dbt3-relative.png | pnmrotate -90 | pnmtopng >dbt3-rel1.png

dbt3-rel2.png: dbt3-relative2.png
	pngtopnm dbt3-relative2.png | pnmrotate -90 | pnmtopng >dbt3-rel2.png

dbt3-rel3.png: dbt3-relative3.png
	pngtopnm dbt3-relative3.png | pnmrotate -90 | pnmtopng >dbt3-rel3.png

dbt3-rel4.png: dbt3-relative4.png
	pngtopnm dbt3-relative4.png | pnmrotate -90 | pnmtopng >dbt3-rel4.png

dbt3-rel5.png: dbt3-relative5.png
	pngtopnm dbt3-relative5.png | pnmrotate -90 | pnmtopng >dbt3-rel5.png

dbt3-abs1.png: dbt3-absolute.png
	pngtopnm dbt3-absolute.png | pnmrotate -90 | pnmtopng >dbt3-abs1.png


