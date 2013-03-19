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
        read:                            1910937
        write:                           0
        other:                           1910937
        total:                           3821874
    transactions:                        1910937 (31848.48 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1910937 (31848.48 per sec.)
    other operations:                    1910937 (31848.48 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1910937
    total time taken by event execution: 1917.0843
    per-request statistics:
         min:                                  0.57ms
         avg:                                  1.00ms
         max:                                 17.27ms
         approx.  95 percentile:               1.19ms

Threads fairness:
    events (avg/stddev):           59716.7812/43.91
    execution time (avg/stddev):   59.9089/0.00

