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
        read:                            1972929
        write:                           0
        other:                           1972929
        total:                           3945858
    transactions:                        1972929 (32877.81 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1972929 (32877.81 per sec.)
    other operations:                    1972929 (32877.81 per sec.)

Test execution summary:
    total time:                          60.0079s
    total number of events:              1972929
    total time taken by event execution: 15351.7791
    per-request statistics:
         min:                                  1.24ms
         avg:                                  7.78ms
         max:                                 92.41ms
         approx.  95 percentile:              19.69ms

Threads fairness:
    events (avg/stddev):           7706.7539/51.94
    execution time (avg/stddev):   59.9679/0.00

