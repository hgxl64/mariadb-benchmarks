sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1058958
        write:                           0
        other:                           1058958
        total:                           2117916
    transactions:                        1058958 (17648.98 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1058958 (17648.98 per sec.)
    other operations:                    1058958 (17648.98 per sec.)

Test execution summary:
    total time:                          60.0011s
    total number of events:              1058958
    total time taken by event execution: 957.9901
    per-request statistics:
         min:                                  0.29ms
         avg:                                  0.90ms
         max:                                  6.54ms
         approx.  95 percentile:               1.07ms

Threads fairness:
    events (avg/stddev):           66184.8750/1331.41
    execution time (avg/stddev):   59.8744/0.01

