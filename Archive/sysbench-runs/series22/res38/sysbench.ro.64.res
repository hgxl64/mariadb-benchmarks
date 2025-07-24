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
        read:                            1053818
        write:                           0
        other:                           1053818
        total:                           2107636
    transactions:                        1053818 (17562.69 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1053818 (17562.69 per sec.)
    other operations:                    1053818 (17562.69 per sec.)

Test execution summary:
    total time:                          60.0032s
    total number of events:              1053818
    total time taken by event execution: 3837.9338
    per-request statistics:
         min:                                  2.96ms
         avg:                                  3.64ms
         max:                                 13.89ms
         approx.  95 percentile:               3.94ms

Threads fairness:
    events (avg/stddev):           16465.9062/6.19
    execution time (avg/stddev):   59.9677/0.00

