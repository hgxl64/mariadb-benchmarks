sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            715779
        write:                           0
        other:                           715779
        total:                           1431558
    transactions:                        715779 (11929.51 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 715779 (11929.51 per sec.)
    other operations:                    715779 (11929.51 per sec.)

Test execution summary:
    total time:                          60.0007s
    total number of events:              715779
    total time taken by event execution: 238.7937
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.33ms
         max:                                  8.41ms
         approx.  95 percentile:               0.42ms

Threads fairness:
    events (avg/stddev):           178944.7500/4392.13
    execution time (avg/stddev):   59.6984/0.01

