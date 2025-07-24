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
        read:                            456767
        write:                           0
        other:                           456767
        total:                           913534
    transactions:                        456767 (7612.76 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 456767 (7612.76 per sec.)
    other operations:                    456767 (7612.76 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              456767
    total time taken by event execution: 59.7393
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.13ms
         max:                                  0.86ms
         approx.  95 percentile:               0.14ms

Threads fairness:
    events (avg/stddev):           456767.0000/0.00
    execution time (avg/stddev):   59.7393/0.00

