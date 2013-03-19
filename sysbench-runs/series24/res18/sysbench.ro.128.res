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
        read:                            1037138
        write:                           0
        other:                           1037138
        total:                           2074276
    transactions:                        1037138 (17283.76 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1037138 (17283.76 per sec.)
    other operations:                    1037138 (17283.76 per sec.)

Test execution summary:
    total time:                          60.0065s
    total number of events:              1037138
    total time taken by event execution: 7677.0557
    per-request statistics:
         min:                                  2.24ms
         avg:                                  7.40ms
         max:                                 19.66ms
         approx.  95 percentile:               7.81ms

Threads fairness:
    events (avg/stddev):           8102.6406/2.13
    execution time (avg/stddev):   59.9770/0.00

