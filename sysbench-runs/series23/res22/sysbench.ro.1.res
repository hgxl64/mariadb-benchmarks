sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            187263
        write:                           0
        other:                           187263
        total:                           374526
    transactions:                        187263 (3121.03 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 187263 (3121.03 per sec.)
    other operations:                    187263 (3121.03 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              187263
    total time taken by event execution: 59.8110
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.32ms
         max:                                  0.76ms
         approx.  95 percentile:               0.44ms

Threads fairness:
    events (avg/stddev):           187263.0000/0.00
    execution time (avg/stddev):   59.8110/0.00

