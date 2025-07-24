sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            467824
        write:                           0
        other:                           467824
        total:                           935648
    transactions:                        467824 (7797.02 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 467824 (7797.02 per sec.)
    other operations:                    467824 (7797.02 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              467824
    total time taken by event execution: 119.4876
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.26ms
         max:                                  0.56ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           233912.0000/1355.00
    execution time (avg/stddev):   59.7438/0.01

