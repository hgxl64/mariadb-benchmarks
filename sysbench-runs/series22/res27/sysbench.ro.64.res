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
        read:                            1827852
        write:                           0
        other:                           1827852
        total:                           3655704
    transactions:                        1827852 (30463.30 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1827852 (30463.30 per sec.)
    other operations:                    1827852 (30463.30 per sec.)

Test execution summary:
    total time:                          60.0018s
    total number of events:              1827852
    total time taken by event execution: 3836.9148
    per-request statistics:
         min:                                  1.37ms
         avg:                                  2.10ms
         max:                                 15.49ms
         approx.  95 percentile:               2.50ms

Threads fairness:
    events (avg/stddev):           28560.1875/19.10
    execution time (avg/stddev):   59.9518/0.00

