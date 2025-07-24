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
        read:                            633361
        write:                           0
        other:                           633361
        total:                           1266722
    transactions:                        633361 (10555.97 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 633361 (10555.97 per sec.)
    other operations:                    633361 (10555.97 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              633361
    total time taken by event execution: 119.1071
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.19ms
         max:                                  0.75ms
         approx.  95 percentile:               0.29ms

Threads fairness:
    events (avg/stddev):           316680.5000/39424.50
    execution time (avg/stddev):   59.5536/0.06

