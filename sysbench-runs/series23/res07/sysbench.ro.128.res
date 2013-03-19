sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1599050
        write:                           0
        other:                           1599050
        total:                           3198100
    transactions:                        1599050 (26648.90 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1599050 (26648.90 per sec.)
    other operations:                    1599050 (26648.90 per sec.)

Test execution summary:
    total time:                          60.0044s
    total number of events:              1599050
    total time taken by event execution: 7676.2286
    per-request statistics:
         min:                                  1.62ms
         avg:                                  4.80ms
         max:                                 38.82ms
         approx.  95 percentile:               9.63ms

Threads fairness:
    events (avg/stddev):           12492.5781/52.59
    execution time (avg/stddev):   59.9705/0.00

