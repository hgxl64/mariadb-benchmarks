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
        read:                            458972
        write:                           0
        other:                           458972
        total:                           917944
    transactions:                        458972 (7649.49 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 458972 (7649.49 per sec.)
    other operations:                    458972 (7649.49 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              458972
    total time taken by event execution: 119.4232
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.26ms
         max:                                  0.65ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           229486.0000/476.00
    execution time (avg/stddev):   59.7116/0.01

