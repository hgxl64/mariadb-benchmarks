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
        read:                            1347702
        write:                           0
        other:                           1347702
        total:                           2695404
    transactions:                        1347702 (22461.02 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1347702 (22461.02 per sec.)
    other operations:                    1347702 (22461.02 per sec.)

Test execution summary:
    total time:                          60.0018s
    total number of events:              1347702
    total time taken by event execution: 3837.4544
    per-request statistics:
         min:                                  1.63ms
         avg:                                  2.85ms
         max:                                  9.58ms
         approx.  95 percentile:               3.43ms

Threads fairness:
    events (avg/stddev):           21057.8438/22.81
    execution time (avg/stddev):   59.9602/0.00

