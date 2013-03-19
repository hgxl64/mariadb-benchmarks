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
        read:                            1147845
        write:                           0
        other:                           1147845
        total:                           2295690
    transactions:                        1147845 (19130.51 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1147845 (19130.51 per sec.)
    other operations:                    1147845 (19130.51 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              1147845
    total time taken by event execution: 958.0866
    per-request statistics:
         min:                                  0.23ms
         avg:                                  0.83ms
         max:                                  3.00ms
         approx.  95 percentile:               1.08ms

Threads fairness:
    events (avg/stddev):           71740.3125/1200.65
    execution time (avg/stddev):   59.8804/0.00

