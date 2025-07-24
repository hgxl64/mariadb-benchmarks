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
        read:                            565691
        write:                           0
        other:                           565691
        total:                           1131382
    transactions:                        565691 (9428.15 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 565691 (9428.15 per sec.)
    other operations:                    565691 (9428.15 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              565691
    total time taken by event execution: 118.9760
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.21ms
         max:                                  9.38ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           282845.5000/4643.50
    execution time (avg/stddev):   59.4880/0.02

