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
        read:                            1072495
        write:                           0
        other:                           1072495
        total:                           2144990
    transactions:                        1072495 (17873.12 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1072495 (17873.12 per sec.)
    other operations:                    1072495 (17873.12 per sec.)

Test execution summary:
    total time:                          60.0060s
    total number of events:              1072495
    total time taken by event execution: 7676.9664
    per-request statistics:
         min:                                  5.90ms
         avg:                                  7.16ms
         max:                                 23.22ms
         approx.  95 percentile:               7.57ms

Threads fairness:
    events (avg/stddev):           8378.8672/2.02
    execution time (avg/stddev):   59.9763/0.00

