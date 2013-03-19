sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1035560
        write:                           0
        other:                           1035560
        total:                           2071120
    transactions:                        1035560 (17257.40 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1035560 (17257.40 per sec.)
    other operations:                    1035560 (17257.40 per sec.)

Test execution summary:
    total time:                          60.0067s
    total number of events:              1035560
    total time taken by event execution: 7676.9835
    per-request statistics:
         min:                                  2.83ms
         avg:                                  7.41ms
         max:                                 18.44ms
         approx.  95 percentile:               7.82ms

Threads fairness:
    events (avg/stddev):           8090.3125/2.37
    execution time (avg/stddev):   59.9764/0.00

