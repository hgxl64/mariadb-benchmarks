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
        read:                            1582107
        write:                           0
        other:                           1582107
        total:                           3164214
    transactions:                        1582107 (26364.88 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1582107 (26364.88 per sec.)
    other operations:                    1582107 (26364.88 per sec.)

Test execution summary:
    total time:                          60.0081s
    total number of events:              1582107
    total time taken by event execution: 15352.7360
    per-request statistics:
         min:                                  1.63ms
         avg:                                  9.70ms
         max:                                 84.25ms
         approx.  95 percentile:              23.98ms

Threads fairness:
    events (avg/stddev):           6180.1055/47.10
    execution time (avg/stddev):   59.9716/0.00

