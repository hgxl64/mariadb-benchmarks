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
        read:                            483802
        write:                           0
        other:                           483802
        total:                           967604
    transactions:                        483802 (8063.33 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 483802 (8063.33 per sec.)
    other operations:                    483802 (8063.33 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              483802
    total time taken by event execution: 119.4559
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.25ms
         max:                                  0.68ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           241901.0000/765.00
    execution time (avg/stddev):   59.7279/0.00

