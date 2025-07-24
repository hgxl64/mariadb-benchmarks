sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            775781
        write:                           0
        other:                           775781
        total:                           1551562
    transactions:                        775781 (12929.61 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 775781 (12929.61 per sec.)
    other operations:                    775781 (12929.61 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              775781
    total time taken by event execution: 238.7658
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.31ms
         max:                                  0.98ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           193945.2500/8229.48
    execution time (avg/stddev):   59.6914/0.02

