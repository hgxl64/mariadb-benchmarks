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
        read:                            2423371
        write:                           0
        other:                           2423371
        total:                           4846742
    transactions:                        2423371 (40387.31 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2423371 (40387.31 per sec.)
    other operations:                    2423371 (40387.31 per sec.)

Test execution summary:
    total time:                          60.0033s
    total number of events:              2423371
    total time taken by event execution: 7674.9604
    per-request statistics:
         min:                                  1.06ms
         avg:                                  3.17ms
         max:                                 28.23ms
         approx.  95 percentile:               6.65ms

Threads fairness:
    events (avg/stddev):           18932.5859/93.27
    execution time (avg/stddev):   59.9606/0.00

