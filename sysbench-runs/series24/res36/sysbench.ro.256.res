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
        read:                            1950727
        write:                           0
        other:                           1950727
        total:                           3901454
    transactions:                        1950727 (32508.58 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1950727 (32508.58 per sec.)
    other operations:                    1950727 (32508.58 per sec.)

Test execution summary:
    total time:                          60.0065s
    total number of events:              1950727
    total time taken by event execution: 15351.6753
    per-request statistics:
         min:                                  1.31ms
         avg:                                  7.87ms
         max:                                 91.38ms
         approx.  95 percentile:              19.92ms

Threads fairness:
    events (avg/stddev):           7620.0273/60.14
    execution time (avg/stddev):   59.9675/0.00

