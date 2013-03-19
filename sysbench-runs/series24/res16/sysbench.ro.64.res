sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1963996
        write:                           0
        other:                           1963996
        total:                           3927992
    transactions:                        1963996 (32732.49 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1963996 (32732.49 per sec.)
    other operations:                    1963996 (32732.49 per sec.)

Test execution summary:
    total time:                          60.0014s
    total number of events:              1963996
    total time taken by event execution: 3836.7279
    per-request statistics:
         min:                                  1.30ms
         avg:                                  1.95ms
         max:                                  6.04ms
         approx.  95 percentile:               2.34ms

Threads fairness:
    events (avg/stddev):           30687.4375/24.58
    execution time (avg/stddev):   59.9489/0.00

