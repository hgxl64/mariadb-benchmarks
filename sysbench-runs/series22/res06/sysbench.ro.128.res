sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2026289
        write:                           0
        other:                           2026289
        total:                           4052578
    transactions:                        2026289 (33769.40 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2026289 (33769.40 per sec.)
    other operations:                    2026289 (33769.40 per sec.)

Test execution summary:
    total time:                          60.0037s
    total number of events:              2026289
    total time taken by event execution: 7675.6435
    per-request statistics:
         min:                                  1.20ms
         avg:                                  3.79ms
         max:                                 27.34ms
         approx.  95 percentile:               7.86ms

Threads fairness:
    events (avg/stddev):           15830.3828/69.09
    execution time (avg/stddev):   59.9660/0.00

