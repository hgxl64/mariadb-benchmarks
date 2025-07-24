sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1133756
        write:                           0
        other:                           1133756
        total:                           2267512
    transactions:                        1133756 (18895.60 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1133756 (18895.60 per sec.)
    other operations:                    1133756 (18895.60 per sec.)

Test execution summary:
    total time:                          60.0011s
    total number of events:              1133756
    total time taken by event execution: 958.0862
    per-request statistics:
         min:                                  0.49ms
         avg:                                  0.85ms
         max:                                  2.65ms
         approx.  95 percentile:               1.00ms

Threads fairness:
    events (avg/stddev):           70859.7500/1067.73
    execution time (avg/stddev):   59.8804/0.01

