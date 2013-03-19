sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2107210
        write:                           0
        other:                           2107210
        total:                           4214420
    transactions:                        2107210 (35118.08 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2107210 (35118.08 per sec.)
    other operations:                    2107210 (35118.08 per sec.)

Test execution summary:
    total time:                          60.0036s
    total number of events:              2107210
    total time taken by event execution: 7675.5821
    per-request statistics:
         min:                                  1.27ms
         avg:                                  3.64ms
         max:                                 29.09ms
         approx.  95 percentile:               7.49ms

Threads fairness:
    events (avg/stddev):           16462.5781/71.91
    execution time (avg/stddev):   59.9655/0.00

