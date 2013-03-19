sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1829000
        write:                           0
        other:                           1829000
        total:                           3658000
    transactions:                        1829000 (30479.34 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1829000 (30479.34 per sec.)
    other operations:                    1829000 (30479.34 per sec.)

Test execution summary:
    total time:                          60.0079s
    total number of events:              1829000
    total time taken by event execution: 15352.2725
    per-request statistics:
         min:                                  1.37ms
         avg:                                  8.39ms
         max:                                 92.32ms
         approx.  95 percentile:              21.09ms

Threads fairness:
    events (avg/stddev):           7144.5312/52.19
    execution time (avg/stddev):   59.9698/0.00

