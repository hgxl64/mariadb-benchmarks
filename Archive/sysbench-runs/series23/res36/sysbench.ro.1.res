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
        read:                            161079
        write:                           0
        other:                           161079
        total:                           322158
    transactions:                        161079 (2684.64 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 161079 (2684.64 per sec.)
    other operations:                    161079 (2684.64 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              161079
    total time taken by event execution: 59.8770
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.37ms
         max:                                  0.69ms
         approx.  95 percentile:               0.47ms

Threads fairness:
    events (avg/stddev):           161079.0000/0.00
    execution time (avg/stddev):   59.8770/0.00

