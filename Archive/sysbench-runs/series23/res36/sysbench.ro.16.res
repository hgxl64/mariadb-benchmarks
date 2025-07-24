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
        read:                            1708552
        write:                           0
        other:                           1708552
        total:                           3417104
    transactions:                        1708552 (28475.63 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1708552 (28475.63 per sec.)
    other operations:                    1708552 (28475.63 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1708552
    total time taken by event execution: 957.3502
    per-request statistics:
         min:                                  0.20ms
         avg:                                  0.56ms
         max:                                 12.01ms
         approx.  95 percentile:               0.71ms

Threads fairness:
    events (avg/stddev):           106784.5000/1737.02
    execution time (avg/stddev):   59.8344/0.01

