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
        read:                            1669932
        write:                           0
        other:                           1669932
        total:                           3339864
    transactions:                        1669932 (27830.74 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1669932 (27830.74 per sec.)
    other operations:                    1669932 (27830.74 per sec.)

Test execution summary:
    total time:                          60.0032s
    total number of events:              1669932
    total time taken by event execution: 7676.1665
    per-request statistics:
         min:                                  1.36ms
         avg:                                  4.60ms
         max:                                 35.62ms
         approx.  95 percentile:               9.24ms

Threads fairness:
    events (avg/stddev):           13046.3438/55.02
    execution time (avg/stddev):   59.9701/0.00

