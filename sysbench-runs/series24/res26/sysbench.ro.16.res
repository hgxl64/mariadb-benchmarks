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
        read:                            2033868
        write:                           0
        other:                           2033868
        total:                           4067736
    transactions:                        2033868 (33897.47 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2033868 (33897.47 per sec.)
    other operations:                    2033868 (33897.47 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              2033868
    total time taken by event execution: 957.0268
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.47ms
         max:                                 17.40ms
         approx.  95 percentile:               0.61ms

Threads fairness:
    events (avg/stddev):           127116.7500/1379.65
    execution time (avg/stddev):   59.8142/0.01

