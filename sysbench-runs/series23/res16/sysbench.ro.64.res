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
        read:                            1686725
        write:                           0
        other:                           1686725
        total:                           3373450
    transactions:                        1686725 (28111.31 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1686725 (28111.31 per sec.)
    other operations:                    1686725 (28111.31 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1686725
    total time taken by event execution: 3837.0403
    per-request statistics:
         min:                                  1.39ms
         avg:                                  2.27ms
         max:                                 12.70ms
         approx.  95 percentile:               2.69ms

Threads fairness:
    events (avg/stddev):           26355.0781/31.29
    execution time (avg/stddev):   59.9538/0.00

