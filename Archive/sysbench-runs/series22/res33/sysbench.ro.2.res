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
        read:                            422019
        write:                           0
        other:                           422019
        total:                           844038
    transactions:                        422019 (7033.61 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 422019 (7033.61 per sec.)
    other operations:                    422019 (7033.61 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              422019
    total time taken by event execution: 119.3393
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.28ms
         max:                                  3.21ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           211009.5000/34.50
    execution time (avg/stddev):   59.6697/0.02

