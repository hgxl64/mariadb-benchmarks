sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1843614
        write:                           0
        other:                           1843614
        total:                           3687228
    transactions:                        1843614 (30725.94 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1843614 (30725.94 per sec.)
    other operations:                    1843614 (30725.94 per sec.)

Test execution summary:
    total time:                          60.0019s
    total number of events:              1843614
    total time taken by event execution: 3836.8479
    per-request statistics:
         min:                                  1.38ms
         avg:                                  2.08ms
         max:                                  8.40ms
         approx.  95 percentile:               2.49ms

Threads fairness:
    events (avg/stddev):           28806.4688/22.66
    execution time (avg/stddev):   59.9507/0.00

