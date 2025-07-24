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
        read:                            972693
        write:                           0
        other:                           972693
        total:                           1945386
    transactions:                        972693 (16210.56 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 972693 (16210.56 per sec.)
    other operations:                    972693 (16210.56 per sec.)

Test execution summary:
    total time:                          60.0037s
    total number of events:              972693
    total time taken by event execution: 7677.0619
    per-request statistics:
         min:                                  1.92ms
         avg:                                  7.89ms
         max:                                 46.85ms
         approx.  95 percentile:              12.89ms

Threads fairness:
    events (avg/stddev):           7599.1641/37.53
    execution time (avg/stddev):   59.9770/0.00

