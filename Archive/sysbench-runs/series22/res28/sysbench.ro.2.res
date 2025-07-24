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
        read:                            419950
        write:                           0
        other:                           419950
        total:                           839900
    transactions:                        419950 (6999.12 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 419950 (6999.12 per sec.)
    other operations:                    419950 (6999.12 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              419950
    total time taken by event execution: 119.5229
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.28ms
         max:                                  0.76ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           209975.0000/1530.00
    execution time (avg/stddev):   59.7615/0.00

