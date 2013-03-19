sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1470736
        write:                           0
        other:                           1470736
        total:                           2941472
    transactions:                        1470736 (24511.97 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1470736 (24511.97 per sec.)
    other operations:                    1470736 (24511.97 per sec.)

Test execution summary:
    total time:                          60.0007s
    total number of events:              1470736
    total time taken by event execution: 957.6203
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.65ms
         max:                                  4.17ms
         approx.  95 percentile:               0.85ms

Threads fairness:
    events (avg/stddev):           91921.0000/1758.34
    execution time (avg/stddev):   59.8513/0.01

