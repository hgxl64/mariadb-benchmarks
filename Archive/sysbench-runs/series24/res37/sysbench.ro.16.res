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
        read:                            1914022
        write:                           0
        other:                           1914022
        total:                           3828044
    transactions:                        1914022 (31900.10 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1914022 (31900.10 per sec.)
    other operations:                    1914022 (31900.10 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1914022
    total time taken by event execution: 957.2609
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.50ms
         max:                                  7.01ms
         approx.  95 percentile:               0.64ms

Threads fairness:
    events (avg/stddev):           119626.3750/1052.42
    execution time (avg/stddev):   59.8288/0.01

