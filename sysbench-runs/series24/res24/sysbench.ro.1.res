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
        read:                            361145
        write:                           0
        other:                           361145
        total:                           722290
    transactions:                        361145 (6019.05 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 361145 (6019.05 per sec.)
    other operations:                    361145 (6019.05 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              361145
    total time taken by event execution: 59.7923
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.17ms
         max:                                  0.67ms
         approx.  95 percentile:               0.24ms

Threads fairness:
    events (avg/stddev):           361145.0000/0.00
    execution time (avg/stddev):   59.7923/0.00

