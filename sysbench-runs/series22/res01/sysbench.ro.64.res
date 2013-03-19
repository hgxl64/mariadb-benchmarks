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
        read:                            1789467
        write:                           0
        other:                           1789467
        total:                           3578934
    transactions:                        1789467 (29823.53 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1789467 (29823.53 per sec.)
    other operations:                    1789467 (29823.53 per sec.)

Test execution summary:
    total time:                          60.0018s
    total number of events:              1789467
    total time taken by event execution: 3836.7948
    per-request statistics:
         min:                                  1.33ms
         avg:                                  2.14ms
         max:                                  6.78ms
         approx.  95 percentile:               2.58ms

Threads fairness:
    events (avg/stddev):           27960.4219/33.28
    execution time (avg/stddev):   59.9499/0.00

