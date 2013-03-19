sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            445367
        write:                           0
        other:                           445367
        total:                           890734
    transactions:                        445367 (7422.74 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 445367 (7422.74 per sec.)
    other operations:                    445367 (7422.74 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              445367
    total time taken by event execution: 119.4201
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.27ms
         max:                                  0.71ms
         approx.  95 percentile:               0.36ms

Threads fairness:
    events (avg/stddev):           222683.5000/696.50
    execution time (avg/stddev):   59.7100/0.01

