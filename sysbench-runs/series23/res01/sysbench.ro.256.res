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
        read:                            1537433
        write:                           0
        other:                           1537433
        total:                           3074866
    transactions:                        1537433 (25620.90 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1537433 (25620.90 per sec.)
    other operations:                    1537433 (25620.90 per sec.)

Test execution summary:
    total time:                          60.0070s
    total number of events:              1537433
    total time taken by event execution: 15352.7411
    per-request statistics:
         min:                                  1.67ms
         avg:                                  9.99ms
         max:                                 88.17ms
         approx.  95 percentile:              24.32ms

Threads fairness:
    events (avg/stddev):           6005.5977/48.58
    execution time (avg/stddev):   59.9716/0.00

