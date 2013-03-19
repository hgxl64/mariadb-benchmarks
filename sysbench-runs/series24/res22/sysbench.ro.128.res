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
        read:                            1432572
        write:                           0
        other:                           1432572
        total:                           2865144
    transactions:                        1432572 (23874.89 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1432572 (23874.89 per sec.)
    other operations:                    1432572 (23874.89 per sec.)

Test execution summary:
    total time:                          60.0033s
    total number of events:              1432572
    total time taken by event execution: 7676.4203
    per-request statistics:
         min:                                  1.59ms
         avg:                                  5.36ms
         max:                                 38.53ms
         approx.  95 percentile:              10.58ms

Threads fairness:
    events (avg/stddev):           11191.9688/60.51
    execution time (avg/stddev):   59.9720/0.00

