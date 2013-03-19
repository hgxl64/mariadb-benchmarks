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
        read:                            1327394
        write:                           0
        other:                           1327394
        total:                           2654788
    transactions:                        1327394 (22121.97 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1327394 (22121.97 per sec.)
    other operations:                    1327394 (22121.97 per sec.)

Test execution summary:
    total time:                          60.0034s
    total number of events:              1327394
    total time taken by event execution: 7676.4872
    per-request statistics:
         min:                                  1.49ms
         avg:                                  5.78ms
         max:                                 35.51ms
         approx.  95 percentile:              10.24ms

Threads fairness:
    events (avg/stddev):           10370.2656/46.22
    execution time (avg/stddev):   59.9726/0.00

