sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1055311
        write:                           0
        other:                           1055311
        total:                           2110622
    transactions:                        1055311 (17584.88 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1055311 (17584.88 per sec.)
    other operations:                    1055311 (17584.88 per sec.)

Test execution summary:
    total time:                          60.0124s
    total number of events:              1055311
    total time taken by event execution: 15353.8677
    per-request statistics:
         min:                                  6.69ms
         avg:                                 14.55ms
         max:                                 77.28ms
         approx.  95 percentile:              22.03ms

Threads fairness:
    events (avg/stddev):           4122.3086/27.89
    execution time (avg/stddev):   59.9760/0.00

