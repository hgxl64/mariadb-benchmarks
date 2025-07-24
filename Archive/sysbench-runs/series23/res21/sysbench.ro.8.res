sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1423834
        write:                           0
        other:                           1423834
        total:                           2847668
    transactions:                        1423834 (23730.40 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1423834 (23730.40 per sec.)
    other operations:                    1423834 (23730.40 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1423834
    total time taken by event execution: 477.8964
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.34ms
         max:                                  1.77ms
         approx.  95 percentile:               0.44ms

Threads fairness:
    events (avg/stddev):           177979.2500/5233.54
    execution time (avg/stddev):   59.7370/0.02

