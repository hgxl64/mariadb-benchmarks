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
        read:                            744230
        write:                           0
        other:                           744230
        total:                           1488460
    transactions:                        744230 (12403.72 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 744230 (12403.72 per sec.)
    other operations:                    744230 (12403.72 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              744230
    total time taken by event execution: 238.7994
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.32ms
         max:                                  3.40ms
         approx.  95 percentile:               0.40ms

Threads fairness:
    events (avg/stddev):           186057.5000/4931.54
    execution time (avg/stddev):   59.6998/0.03

