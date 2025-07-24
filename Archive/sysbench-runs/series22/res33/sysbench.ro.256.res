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
        read:                            1325639
        write:                           0
        other:                           1325639
        total:                           2651278
    transactions:                        1325639 (22091.54 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1325639 (22091.54 per sec.)
    other operations:                    1325639 (22091.54 per sec.)

Test execution summary:
    total time:                          60.0066s
    total number of events:              1325639
    total time taken by event execution: 15352.3788
    per-request statistics:
         min:                                  1.59ms
         avg:                                 11.58ms
         max:                                 98.17ms
         approx.  95 percentile:              22.51ms

Threads fairness:
    events (avg/stddev):           5178.2773/52.70
    execution time (avg/stddev):   59.9702/0.00

