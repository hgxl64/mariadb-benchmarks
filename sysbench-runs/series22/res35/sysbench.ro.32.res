sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2547702
        write:                           0
        other:                           2547702
        total:                           5095404
    transactions:                        2547702 (42461.04 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2547702 (42461.04 per sec.)
    other operations:                    2547702 (42461.04 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              2547702
    total time taken by event execution: 1916.1798
    per-request statistics:
         min:                                  0.27ms
         avg:                                  0.75ms
         max:                                 14.38ms
         approx.  95 percentile:               0.93ms

Threads fairness:
    events (avg/stddev):           79615.6875/205.37
    execution time (avg/stddev):   59.8806/0.00

