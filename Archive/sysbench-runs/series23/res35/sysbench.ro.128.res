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
        read:                            2097762
        write:                           0
        other:                           2097762
        total:                           4195524
    transactions:                        2097762 (34960.75 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2097762 (34960.75 per sec.)
    other operations:                    2097762 (34960.75 per sec.)

Test execution summary:
    total time:                          60.0033s
    total number of events:              2097762
    total time taken by event execution: 7675.6549
    per-request statistics:
         min:                                  1.29ms
         avg:                                  3.66ms
         max:                                 30.78ms
         approx.  95 percentile:               7.52ms

Threads fairness:
    events (avg/stddev):           16388.7656/69.48
    execution time (avg/stddev):   59.9661/0.00

