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
        read:                            1684127
        write:                           0
        other:                           1684127
        total:                           3368254
    transactions:                        1684127 (28065.58 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1684127 (28065.58 per sec.)
    other operations:                    1684127 (28065.58 per sec.)

Test execution summary:
    total time:                          60.0068s
    total number of events:              1684127
    total time taken by event execution: 15352.9085
    per-request statistics:
         min:                                  1.41ms
         avg:                                  9.12ms
         max:                                 80.01ms
         approx.  95 percentile:              22.77ms

Threads fairness:
    events (avg/stddev):           6578.6211/49.69
    execution time (avg/stddev):   59.9723/0.00

