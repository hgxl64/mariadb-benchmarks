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
        read:                            337678
        write:                           0
        other:                           337678
        total:                           675356
    transactions:                        337678 (5627.93 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 337678 (5627.93 per sec.)
    other operations:                    337678 (5627.93 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              337678
    total time taken by event execution: 59.8000
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.18ms
         max:                                  0.87ms
         approx.  95 percentile:               0.29ms

Threads fairness:
    events (avg/stddev):           337678.0000/0.00
    execution time (avg/stddev):   59.8000/0.00

