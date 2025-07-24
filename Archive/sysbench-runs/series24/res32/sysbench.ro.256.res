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
        read:                            1416012
        write:                           0
        other:                           1416012
        total:                           2832024
    transactions:                        1416012 (23597.85 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1416012 (23597.85 per sec.)
    other operations:                    1416012 (23597.85 per sec.)

Test execution summary:
    total time:                          60.0060s
    total number of events:              1416012
    total time taken by event execution: 15352.0506
    per-request statistics:
         min:                                  1.47ms
         avg:                                 10.84ms
         max:                                 99.72ms
         approx.  95 percentile:              26.24ms

Threads fairness:
    events (avg/stddev):           5531.2969/48.75
    execution time (avg/stddev):   59.9689/0.00

