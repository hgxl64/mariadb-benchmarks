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
        read:                            1437336
        write:                           0
        other:                           1437336
        total:                           2874672
    transactions:                        1437336 (23955.30 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1437336 (23955.30 per sec.)
    other operations:                    1437336 (23955.30 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              1437336
    total time taken by event execution: 957.0742
    per-request statistics:
         min:                                  0.37ms
         avg:                                  0.67ms
         max:                                  6.40ms
         approx.  95 percentile:               0.78ms

Threads fairness:
    events (avg/stddev):           89833.5000/4054.94
    execution time (avg/stddev):   59.8171/0.01

