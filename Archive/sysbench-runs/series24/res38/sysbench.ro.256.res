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
        read:                            1030002
        write:                           0
        other:                           1030002
        total:                           2060004
    transactions:                        1030002 (17163.11 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1030002 (17163.11 per sec.)
    other operations:                    1030002 (17163.11 per sec.)

Test execution summary:
    total time:                          60.0125s
    total number of events:              1030002
    total time taken by event execution: 15353.7520
    per-request statistics:
         min:                                  5.77ms
         avg:                                 14.91ms
         max:                                 72.15ms
         approx.  95 percentile:              22.55ms

Threads fairness:
    events (avg/stddev):           4023.4453/25.49
    execution time (avg/stddev):   59.9756/0.01

