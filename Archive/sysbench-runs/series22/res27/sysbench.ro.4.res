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
        read:                            823155
        write:                           0
        other:                           823155
        total:                           1646310
    transactions:                        823155 (13719.19 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 823155 (13719.19 per sec.)
    other operations:                    823155 (13719.19 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              823155
    total time taken by event execution: 238.6176
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.29ms
         max:                                  0.93ms
         approx.  95 percentile:               0.40ms

Threads fairness:
    events (avg/stddev):           205788.7500/4698.77
    execution time (avg/stddev):   59.6544/0.02

