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
        read:                            1670750
        write:                           0
        other:                           1670750
        total:                           3341500
    transactions:                        1670750 (27842.81 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1670750 (27842.81 per sec.)
    other operations:                    1670750 (27842.81 per sec.)

Test execution summary:
    total time:                          60.0065s
    total number of events:              1670750
    total time taken by event execution: 15352.5057
    per-request statistics:
         min:                                  1.47ms
         avg:                                  9.19ms
         max:                                 95.14ms
         approx.  95 percentile:              22.75ms

Threads fairness:
    events (avg/stddev):           6526.3672/57.12
    execution time (avg/stddev):   59.9707/0.00

