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
        read:                            169772
        write:                           0
        other:                           169772
        total:                           339544
    transactions:                        169772 (2829.51 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 169772 (2829.51 per sec.)
    other operations:                    169772 (2829.51 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              169772
    total time taken by event execution: 59.8476
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.35ms
         max:                                  0.81ms
         approx.  95 percentile:               0.47ms

Threads fairness:
    events (avg/stddev):           169772.0000/0.00
    execution time (avg/stddev):   59.8476/0.00

