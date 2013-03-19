sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            401544
        write:                           0
        other:                           401544
        total:                           803088
    transactions:                        401544 (6692.38 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 401544 (6692.38 per sec.)
    other operations:                    401544 (6692.38 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              401544
    total time taken by event execution: 119.5779
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.30ms
         max:                                  1.40ms
         approx.  95 percentile:               0.36ms

Threads fairness:
    events (avg/stddev):           200772.0000/757.00
    execution time (avg/stddev):   59.7889/0.01

