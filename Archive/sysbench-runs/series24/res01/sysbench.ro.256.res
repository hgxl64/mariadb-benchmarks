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
        read:                            1665203
        write:                           0
        other:                           1665203
        total:                           3330406
    transactions:                        1665203 (27750.21 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1665203 (27750.21 per sec.)
    other operations:                    1665203 (27750.21 per sec.)

Test execution summary:
    total time:                          60.0069s
    total number of events:              1665203
    total time taken by event execution: 15352.4296
    per-request statistics:
         min:                                  1.44ms
         avg:                                  9.22ms
         max:                                 87.78ms
         approx.  95 percentile:              22.77ms

Threads fairness:
    events (avg/stddev):           6504.6992/55.59
    execution time (avg/stddev):   59.9704/0.00

