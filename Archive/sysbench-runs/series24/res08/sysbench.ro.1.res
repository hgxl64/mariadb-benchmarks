sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            193480
        write:                           0
        other:                           193480
        total:                           386960
    transactions:                        193480 (3224.65 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 193480 (3224.65 per sec.)
    other operations:                    193480 (3224.65 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              193480
    total time taken by event execution: 59.7881
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.31ms
         max:                                  0.93ms
         approx.  95 percentile:               0.39ms

Threads fairness:
    events (avg/stddev):           193480.0000/0.00
    execution time (avg/stddev):   59.7881/0.00

