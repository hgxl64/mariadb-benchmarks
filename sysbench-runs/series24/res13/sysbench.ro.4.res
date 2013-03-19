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
        read:                            788031
        write:                           0
        other:                           788031
        total:                           1576062
    transactions:                        788031 (13133.81 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 788031 (13133.81 per sec.)
    other operations:                    788031 (13133.81 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              788031
    total time taken by event execution: 238.5600
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.30ms
         max:                                  1.30ms
         approx.  95 percentile:               0.41ms

Threads fairness:
    events (avg/stddev):           197007.7500/1053.91
    execution time (avg/stddev):   59.6400/0.02

