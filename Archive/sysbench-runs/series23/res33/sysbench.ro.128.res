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
        read:                            1000438
        write:                           0
        other:                           1000438
        total:                           2000876
    transactions:                        1000438 (16672.93 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1000438 (16672.93 per sec.)
    other operations:                    1000438 (16672.93 per sec.)

Test execution summary:
    total time:                          60.0037s
    total number of events:              1000438
    total time taken by event execution: 7676.9296
    per-request statistics:
         min:                                  1.83ms
         avg:                                  7.67ms
         max:                                 43.48ms
         approx.  95 percentile:              12.48ms

Threads fairness:
    events (avg/stddev):           7815.9219/36.27
    execution time (avg/stddev):   59.9760/0.00

