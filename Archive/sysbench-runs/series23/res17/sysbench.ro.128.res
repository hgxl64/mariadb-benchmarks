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
        read:                            1586475
        write:                           0
        other:                           1586475
        total:                           3172950
    transactions:                        1586475 (26439.52 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1586475 (26439.52 per sec.)
    other operations:                    1586475 (26439.52 per sec.)

Test execution summary:
    total time:                          60.0039s
    total number of events:              1586475
    total time taken by event execution: 7676.1678
    per-request statistics:
         min:                                  1.60ms
         avg:                                  4.84ms
         max:                                 33.16ms
         approx.  95 percentile:               9.73ms

Threads fairness:
    events (avg/stddev):           12394.3359/47.23
    execution time (avg/stddev):   59.9701/0.00

