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
        read:                            1050003
        write:                           0
        other:                           1050003
        total:                           2100006
    transactions:                        1050003 (17499.20 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1050003 (17499.20 per sec.)
    other operations:                    1050003 (17499.20 per sec.)

Test execution summary:
    total time:                          60.0029s
    total number of events:              1050003
    total time taken by event execution: 3837.9034
    per-request statistics:
         min:                                  2.64ms
         avg:                                  3.66ms
         max:                                 20.18ms
         approx.  95 percentile:               3.95ms

Threads fairness:
    events (avg/stddev):           16406.2969/6.97
    execution time (avg/stddev):   59.9672/0.00

