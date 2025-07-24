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
        read:                            1352150
        write:                           0
        other:                           1352150
        total:                           2704300
    transactions:                        1352150 (22535.26 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1352150 (22535.26 per sec.)
    other operations:                    1352150 (22535.26 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              1352150
    total time taken by event execution: 3837.4944
    per-request statistics:
         min:                                  1.31ms
         avg:                                  2.84ms
         max:                                  6.12ms
         approx.  95 percentile:               3.43ms

Threads fairness:
    events (avg/stddev):           21127.3438/21.13
    execution time (avg/stddev):   59.9608/0.00

