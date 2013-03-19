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
        read:                            1326947
        write:                           0
        other:                           1326947
        total:                           2653894
    transactions:                        1326947 (22113.12 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1326947 (22113.12 per sec.)
    other operations:                    1326947 (22113.12 per sec.)

Test execution summary:
    total time:                          60.0072s
    total number of events:              1326947
    total time taken by event execution: 15352.4365
    per-request statistics:
         min:                                  1.73ms
         avg:                                 11.57ms
         max:                                111.96ms
         approx.  95 percentile:              22.50ms

Threads fairness:
    events (avg/stddev):           5183.3867/48.99
    execution time (avg/stddev):   59.9705/0.00

