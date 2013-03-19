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
        read:                            909011
        write:                           0
        other:                           909011
        total:                           1818022
    transactions:                        909011 (15150.10 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 909011 (15150.10 per sec.)
    other operations:                    909011 (15150.10 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              909011
    total time taken by event execution: 239.0531
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.26ms
         max:                                  0.75ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           227252.7500/987.30
    execution time (avg/stddev):   59.7633/0.00

