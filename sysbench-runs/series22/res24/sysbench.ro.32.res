sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1051329
        write:                           0
        other:                           1051329
        total:                           2102658
    transactions:                        1051329 (17521.65 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1051329 (17521.65 per sec.)
    other operations:                    1051329 (17521.65 per sec.)

Test execution summary:
    total time:                          60.0017s
    total number of events:              1051329
    total time taken by event execution: 1918.1827
    per-request statistics:
         min:                                  1.34ms
         avg:                                  1.82ms
         max:                                  4.53ms
         approx.  95 percentile:               2.05ms

Threads fairness:
    events (avg/stddev):           32854.0312/30.41
    execution time (avg/stddev):   59.9432/0.00

