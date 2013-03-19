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
        read:                            1205171
        write:                           0
        other:                           1205171
        total:                           2410342
    transactions:                        1205171 (20085.91 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1205171 (20085.91 per sec.)
    other operations:                    1205171 (20085.91 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              1205171
    total time taken by event execution: 958.2464
    per-request statistics:
         min:                                  0.48ms
         avg:                                  0.80ms
         max:                                  2.01ms
         approx.  95 percentile:               0.93ms

Threads fairness:
    events (avg/stddev):           75323.1875/982.25
    execution time (avg/stddev):   59.8904/0.01

