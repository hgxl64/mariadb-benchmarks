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
        read:                            455531
        write:                           0
        other:                           455531
        total:                           911062
    transactions:                        455531 (7592.15 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 455531 (7592.15 per sec.)
    other operations:                    455531 (7592.15 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              455531
    total time taken by event execution: 119.3154
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.26ms
         max:                                  0.83ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           227765.5000/927.50
    execution time (avg/stddev):   59.6577/0.03

