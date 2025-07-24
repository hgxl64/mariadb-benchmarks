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
        read:                            1344596
        write:                           0
        other:                           1344596
        total:                           2689192
    transactions:                        1344596 (22407.38 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1344596 (22407.38 per sec.)
    other operations:                    1344596 (22407.38 per sec.)

Test execution summary:
    total time:                          60.0068s
    total number of events:              1344596
    total time taken by event execution: 15352.0332
    per-request statistics:
         min:                                  1.54ms
         avg:                                 11.42ms
         max:                                 99.85ms
         approx.  95 percentile:              26.51ms

Threads fairness:
    events (avg/stddev):           5252.3281/46.41
    execution time (avg/stddev):   59.9689/0.00

