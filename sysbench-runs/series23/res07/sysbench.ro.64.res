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
        read:                            1652454
        write:                           0
        other:                           1652454
        total:                           3304908
    transactions:                        1652454 (27539.93 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1652454 (27539.93 per sec.)
    other operations:                    1652454 (27539.93 per sec.)

Test execution summary:
    total time:                          60.0021s
    total number of events:              1652454
    total time taken by event execution: 3837.1288
    per-request statistics:
         min:                                  1.55ms
         avg:                                  2.32ms
         max:                                  8.81ms
         approx.  95 percentile:               2.75ms

Threads fairness:
    events (avg/stddev):           25819.5938/23.05
    execution time (avg/stddev):   59.9551/0.00

