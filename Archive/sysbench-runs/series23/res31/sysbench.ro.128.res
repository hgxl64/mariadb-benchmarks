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
        read:                            1534591
        write:                           0
        other:                           1534591
        total:                           3069182
    transactions:                        1534591 (25574.93 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1534591 (25574.93 per sec.)
    other operations:                    1534591 (25574.93 per sec.)

Test execution summary:
    total time:                          60.0037s
    total number of events:              1534591
    total time taken by event execution: 7676.4133
    per-request statistics:
         min:                                  1.68ms
         avg:                                  5.00ms
         max:                                 31.93ms
         approx.  95 percentile:               9.94ms

Threads fairness:
    events (avg/stddev):           11988.9922/43.68
    execution time (avg/stddev):   59.9720/0.00

