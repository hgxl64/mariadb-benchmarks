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
        read:                            424737
        write:                           0
        other:                           424737
        total:                           849474
    transactions:                        424737 (7078.91 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 424737 (7078.91 per sec.)
    other operations:                    424737 (7078.91 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              424737
    total time taken by event execution: 119.4359
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.28ms
         max:                                  0.78ms
         approx.  95 percentile:               0.37ms

Threads fairness:
    events (avg/stddev):           212368.5000/1202.50
    execution time (avg/stddev):   59.7180/0.01

