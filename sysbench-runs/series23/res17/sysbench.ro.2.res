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
        read:                            807026
        write:                           0
        other:                           807026
        total:                           1614052
    transactions:                        807026 (13450.38 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 807026 (13450.38 per sec.)
    other operations:                    807026 (13450.38 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              807026
    total time taken by event execution: 119.4107
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.15ms
         max:                                  0.68ms
         approx.  95 percentile:               0.25ms

Threads fairness:
    events (avg/stddev):           403513.0000/444.00
    execution time (avg/stddev):   59.7054/0.00

