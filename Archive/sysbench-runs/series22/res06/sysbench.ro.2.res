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
        read:                            777861
        write:                           0
        other:                           777861
        total:                           1555722
    transactions:                        777861 (12964.30 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 777861 (12964.30 per sec.)
    other operations:                    777861 (12964.30 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              777861
    total time taken by event execution: 118.7534
    per-request statistics:
         min:                                  0.10ms
         avg:                                  0.15ms
         max:                                  0.72ms
         approx.  95 percentile:               0.23ms

Threads fairness:
    events (avg/stddev):           388930.5000/106161.50
    execution time (avg/stddev):   59.3767/0.15

