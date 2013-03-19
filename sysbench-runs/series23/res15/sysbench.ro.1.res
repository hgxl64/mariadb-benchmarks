sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            210346
        write:                           0
        other:                           210346
        total:                           420692
    transactions:                        210346 (3505.74 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 210346 (3505.74 per sec.)
    other operations:                    210346 (3505.74 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              210346
    total time taken by event execution: 59.8627
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.28ms
         max:                                  0.72ms
         approx.  95 percentile:               0.40ms

Threads fairness:
    events (avg/stddev):           210346.0000/0.00
    execution time (avg/stddev):   59.8627/0.00

