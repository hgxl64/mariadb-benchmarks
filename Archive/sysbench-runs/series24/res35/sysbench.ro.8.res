sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1866185
        write:                           0
        other:                           1866185
        total:                           3732370
    transactions:                        1866185 (31102.94 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1866185 (31102.94 per sec.)
    other operations:                    1866185 (31102.94 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1866185
    total time taken by event execution: 477.2237
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.26ms
         max:                                  1.77ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           233273.1250/6091.03
    execution time (avg/stddev):   59.6530/0.02

