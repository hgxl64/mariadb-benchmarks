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
        read:                            1418251
        write:                           0
        other:                           1418251
        total:                           2836502
    transactions:                        1418251 (23637.25 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1418251 (23637.25 per sec.)
    other operations:                    1418251 (23637.25 per sec.)

Test execution summary:
    total time:                          60.0007s
    total number of events:              1418251
    total time taken by event execution: 957.3856
    per-request statistics:
         min:                                  0.41ms
         avg:                                  0.68ms
         max:                                  2.98ms
         approx.  95 percentile:               0.82ms

Threads fairness:
    events (avg/stddev):           88640.6875/1611.00
    execution time (avg/stddev):   59.8366/0.01

