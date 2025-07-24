sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1061779
        write:                           0
        other:                           1061779
        total:                           2123558
    transactions:                        1061779 (17695.41 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1061779 (17695.41 per sec.)
    other operations:                    1061779 (17695.41 per sec.)

Test execution summary:
    total time:                          60.0031s
    total number of events:              1061779
    total time taken by event execution: 3837.8923
    per-request statistics:
         min:                                  2.08ms
         avg:                                  3.61ms
         max:                                 15.96ms
         approx.  95 percentile:               3.92ms

Threads fairness:
    events (avg/stddev):           16590.2969/7.75
    execution time (avg/stddev):   59.9671/0.00

