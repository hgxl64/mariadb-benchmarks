sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1971824
        write:                           0
        other:                           1971824
        total:                           3943648
    transactions:                        1971824 (32863.54 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1971824 (32863.54 per sec.)
    other operations:                    1971824 (32863.54 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1971824
    total time taken by event execution: 477.1369
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.24ms
         max:                                  1.54ms
         approx.  95 percentile:               0.30ms

Threads fairness:
    events (avg/stddev):           246478.0000/6066.44
    execution time (avg/stddev):   59.6421/0.02

