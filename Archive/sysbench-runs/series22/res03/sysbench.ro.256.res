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
        read:                            1294597
        write:                           0
        other:                           1294597
        total:                           2589194
    transactions:                        1294597 (21573.91 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1294597 (21573.91 per sec.)
    other operations:                    1294597 (21573.91 per sec.)

Test execution summary:
    total time:                          60.0075s
    total number of events:              1294597
    total time taken by event execution: 15352.8115
    per-request statistics:
         min:                                  1.80ms
         avg:                                 11.86ms
         max:                                104.14ms
         approx.  95 percentile:              22.92ms

Threads fairness:
    events (avg/stddev):           5057.0195/40.51
    execution time (avg/stddev):   59.9719/0.00

