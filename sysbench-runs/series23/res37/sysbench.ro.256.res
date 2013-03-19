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
        read:                            1581250
        write:                           0
        other:                           1581250
        total:                           3162500
    transactions:                        1581250 (26350.76 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1581250 (26350.76 per sec.)
    other operations:                    1581250 (26350.76 per sec.)

Test execution summary:
    total time:                          60.0078s
    total number of events:              1581250
    total time taken by event execution: 15352.5323
    per-request statistics:
         min:                                  1.61ms
         avg:                                  9.71ms
         max:                                 97.82ms
         approx.  95 percentile:              24.01ms

Threads fairness:
    events (avg/stddev):           6176.7578/47.13
    execution time (avg/stddev):   59.9708/0.00

