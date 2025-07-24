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
        read:                            470778
        write:                           0
        other:                           470778
        total:                           941556
    transactions:                        470778 (7846.26 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 470778 (7846.26 per sec.)
    other operations:                    470778 (7846.26 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              470778
    total time taken by event execution: 119.4502
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.25ms
         max:                                  0.71ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           235389.0000/2093.00
    execution time (avg/stddev):   59.7251/0.00

