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
        read:                            1536768
        write:                           0
        other:                           1536768
        total:                           3073536
    transactions:                        1536768 (25612.05 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1536768 (25612.05 per sec.)
    other operations:                    1536768 (25612.05 per sec.)

Test execution summary:
    total time:                          60.0018s
    total number of events:              1536768
    total time taken by event execution: 3837.4214
    per-request statistics:
         min:                                  1.50ms
         avg:                                  2.50ms
         max:                                  8.56ms
         approx.  95 percentile:               2.95ms

Threads fairness:
    events (avg/stddev):           24012.0000/16.59
    execution time (avg/stddev):   59.9597/0.00

