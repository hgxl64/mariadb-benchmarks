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
        read:                            2101642
        write:                           0
        other:                           2101642
        total:                           4203284
    transactions:                        2101642 (35023.14 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2101642 (35023.14 per sec.)
    other operations:                    2101642 (35023.14 per sec.)

Test execution summary:
    total time:                          60.0072s
    total number of events:              2101642
    total time taken by event execution: 15351.7413
    per-request statistics:
         min:                                  1.28ms
         avg:                                  7.30ms
         max:                                 78.88ms
         approx.  95 percentile:              18.47ms

Threads fairness:
    events (avg/stddev):           8209.5391/59.68
    execution time (avg/stddev):   59.9677/0.00

