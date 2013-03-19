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
        read:                            766703
        write:                           0
        other:                           766703
        total:                           1533406
    transactions:                        766703 (12778.31 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 766703 (12778.31 per sec.)
    other operations:                    766703 (12778.31 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              766703
    total time taken by event execution: 238.6741
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.31ms
         max:                                  1.43ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           191675.7500/3049.37
    execution time (avg/stddev):   59.6685/0.01

