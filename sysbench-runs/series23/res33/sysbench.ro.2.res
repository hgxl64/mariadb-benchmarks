sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            603329
        write:                           0
        other:                           603329
        total:                           1206658
    transactions:                        603329 (10055.44 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 603329 (10055.44 per sec.)
    other operations:                    603329 (10055.44 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              603329
    total time taken by event execution: 119.0461
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.20ms
         max:                                  1.55ms
         approx.  95 percentile:               0.28ms

Threads fairness:
    events (avg/stddev):           301664.5000/70832.50
    execution time (avg/stddev):   59.5231/0.09

