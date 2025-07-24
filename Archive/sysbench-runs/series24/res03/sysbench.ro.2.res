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
        read:                            495424
        write:                           0
        other:                           495424
        total:                           990848
    transactions:                        495424 (8257.02 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 495424 (8257.02 per sec.)
    other operations:                    495424 (8257.02 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              495424
    total time taken by event execution: 119.4294
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.24ms
         max:                                  0.74ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           247712.0000/748.00
    execution time (avg/stddev):   59.7147/0.00

