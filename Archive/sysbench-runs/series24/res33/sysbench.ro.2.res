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
        read:                            486349
        write:                           0
        other:                           486349
        total:                           972698
    transactions:                        486349 (8105.77 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 486349 (8105.77 per sec.)
    other operations:                    486349 (8105.77 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              486349
    total time taken by event execution: 119.3433
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.25ms
         max:                                  0.76ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           243174.5000/13394.50
    execution time (avg/stddev):   59.6717/0.03

