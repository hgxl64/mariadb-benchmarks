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
        read:                            1266386
        write:                           0
        other:                           1266386
        total:                           2532772
    transactions:                        1266386 (21105.23 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1266386 (21105.23 per sec.)
    other operations:                    1266386 (21105.23 per sec.)

Test execution summary:
    total time:                          60.0034s
    total number of events:              1266386
    total time taken by event execution: 7676.5479
    per-request statistics:
         min:                                  1.55ms
         avg:                                  6.06ms
         max:                                 36.93ms
         approx.  95 percentile:              10.31ms

Threads fairness:
    events (avg/stddev):           9893.6406/40.45
    execution time (avg/stddev):   59.9730/0.00

