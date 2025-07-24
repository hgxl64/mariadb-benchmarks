sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1364559
        write:                           0
        other:                           1364559
        total:                           2729118
    transactions:                        1364559 (22742.23 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1364559 (22742.23 per sec.)
    other operations:                    1364559 (22742.23 per sec.)

Test execution summary:
    total time:                          60.0011s
    total number of events:              1364559
    total time taken by event execution: 1917.7144
    per-request statistics:
         min:                                  0.79ms
         avg:                                  1.41ms
         max:                                  5.18ms
         approx.  95 percentile:               1.67ms

Threads fairness:
    events (avg/stddev):           42642.4688/53.85
    execution time (avg/stddev):   59.9286/0.00

