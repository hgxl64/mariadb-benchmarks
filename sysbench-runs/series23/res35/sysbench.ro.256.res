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
        read:                            2090611
        write:                           0
        other:                           2090611
        total:                           4181222
    transactions:                        2090611 (34839.47 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2090611 (34839.47 per sec.)
    other operations:                    2090611 (34839.47 per sec.)

Test execution summary:
    total time:                          60.0070s
    total number of events:              2090611
    total time taken by event execution: 15351.8958
    per-request statistics:
         min:                                  1.22ms
         avg:                                  7.34ms
         max:                                 83.58ms
         approx.  95 percentile:              18.57ms

Threads fairness:
    events (avg/stddev):           8166.4492/57.14
    execution time (avg/stddev):   59.9683/0.00

