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
        read:                            2424051
        write:                           0
        other:                           2424051
        total:                           4848102
    transactions:                        2424051 (40395.17 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2424051 (40395.17 per sec.)
    other operations:                    2424051 (40395.17 per sec.)

Test execution summary:
    total time:                          60.0084s
    total number of events:              2424051
    total time taken by event execution: 15351.2899
    per-request statistics:
         min:                                  1.06ms
         avg:                                  6.33ms
         max:                                 86.63ms
         approx.  95 percentile:              16.29ms

Threads fairness:
    events (avg/stddev):           9468.9492/74.88
    execution time (avg/stddev):   59.9660/0.00

