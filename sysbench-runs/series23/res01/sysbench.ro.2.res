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
        read:                            477109
        write:                           0
        other:                           477109
        total:                           954218
    transactions:                        477109 (7951.76 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 477109 (7951.76 per sec.)
    other operations:                    477109 (7951.76 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              477109
    total time taken by event execution: 119.4219
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.25ms
         max:                                  0.71ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           238554.5000/1999.50
    execution time (avg/stddev):   59.7109/0.00

