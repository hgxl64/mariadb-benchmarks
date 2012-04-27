all: dbt3-ib-abs1.png dbt3-ib-rel1.png dbt3-ib-rel2.png dbt3-ib-rel3.png dbt3-ib-rel4.png

current: current.plot
	gnuplot -p current.plot
	touch current

clean:
	-rm *.png

#------ fixed targets --------

%.png: %.plot
	gnuplot $<

#------ dependencies ---------

dbt3-ib-abs1.png: summary_maria_vs_mysql.dat
dbt3-ib-rel1.png: summary_maria_vs_mysql.dat
dbt3-ib-rel2.png: summary_innodb_vs_myisam.dat
dbt3-ib-rel3.png: summary_mysql.dat
dbt3-ib-rel4.png: summary_maria.dat



