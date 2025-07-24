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
        read:                            1907865
        write:                           0
        other:                           1907865
        total:                           3815730
    transactions:                        1907865 (31797.17 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1907865 (31797.17 per sec.)
    other operations:                    1907865 (31797.17 per sec.)

Test execution summary:
    total time:                          60.0011s
    total number of events:              1907865
    total time taken by event execution: 1917.0435
    per-request statistics:
         min:                                  0.57ms
         avg:                                  1.00ms
         max:                                  6.90ms
         approx.  95 percentile:               1.19ms

Threads fairness:
    events (avg/stddev):           59620.7812/46.64
    execution time (avg/stddev):   59.9076/0.00

