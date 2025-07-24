sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            903828
        write:                           0
        other:                           903828
        total:                           1807656
    transactions:                        903828 (15063.74 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 903828 (15063.74 per sec.)
    other operations:                    903828 (15063.74 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              903828
    total time taken by event execution: 238.3358
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.26ms
         max:                                  4.29ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           225957.0000/21403.04
    execution time (avg/stddev):   59.5839/0.08

