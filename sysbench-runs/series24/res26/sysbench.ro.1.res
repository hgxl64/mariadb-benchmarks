sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            171679
        write:                           0
        other:                           171679
        total:                           343358
    transactions:                        171679 (2861.30 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 171679 (2861.30 per sec.)
    other operations:                    171679 (2861.30 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              171679
    total time taken by event execution: 59.8506
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.35ms
         max:                                  0.65ms
         approx.  95 percentile:               0.46ms

Threads fairness:
    events (avg/stddev):           171679.0000/0.00
    execution time (avg/stddev):   59.8506/0.00

