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
        read:                            1544364
        write:                           0
        other:                           1544364
        total:                           3088728
    transactions:                        1544364 (25736.40 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1544364 (25736.40 per sec.)
    other operations:                    1544364 (25736.40 per sec.)

Test execution summary:
    total time:                          60.0070s
    total number of events:              1544364
    total time taken by event execution: 15352.6182
    per-request statistics:
         min:                                  1.70ms
         avg:                                  9.94ms
         max:                                 89.29ms
         approx.  95 percentile:              24.21ms

Threads fairness:
    events (avg/stddev):           6032.6719/46.12
    execution time (avg/stddev):   59.9712/0.00

