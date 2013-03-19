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
        read:                            1412233
        write:                           0
        other:                           1412233
        total:                           2824466
    transactions:                        1412233 (23534.97 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1412233 (23534.97 per sec.)
    other operations:                    1412233 (23534.97 per sec.)

Test execution summary:
    total time:                          60.0057s
    total number of events:              1412233
    total time taken by event execution: 15352.2750
    per-request statistics:
         min:                                  1.37ms
         avg:                                 10.87ms
         max:                                 97.16ms
         approx.  95 percentile:              26.04ms

Threads fairness:
    events (avg/stddev):           5516.5352/46.26
    execution time (avg/stddev):   59.9698/0.00

