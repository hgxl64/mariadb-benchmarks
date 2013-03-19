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
        read:                            1003085
        write:                           0
        other:                           1003085
        total:                           2006170
    transactions:                        1003085 (16717.59 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1003085 (16717.59 per sec.)
    other operations:                    1003085 (16717.59 per sec.)

Test execution summary:
    total time:                          60.0018s
    total number of events:              1003085
    total time taken by event execution: 3837.8677
    per-request statistics:
         min:                                  1.63ms
         avg:                                  3.83ms
         max:                                 11.43ms
         approx.  95 percentile:               4.51ms

Threads fairness:
    events (avg/stddev):           15673.2031/16.68
    execution time (avg/stddev):   59.9667/0.00

