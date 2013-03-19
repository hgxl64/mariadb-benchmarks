sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            905122
        write:                           0
        other:                           905122
        total:                           1810244
    transactions:                        905122 (15085.31 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 905122 (15085.31 per sec.)
    other operations:                    905122 (15085.31 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              905122
    total time taken by event execution: 238.8846
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.26ms
         max:                                  1.51ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           226280.5000/15003.19
    execution time (avg/stddev):   59.7211/0.03

