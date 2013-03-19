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
        read:                            171281
        write:                           0
        other:                           171281
        total:                           342562
    transactions:                        171281 (2854.67 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 171281 (2854.67 per sec.)
    other operations:                    171281 (2854.67 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              171281
    total time taken by event execution: 59.8608
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.35ms
         max:                                  0.75ms
         approx.  95 percentile:               0.45ms

Threads fairness:
    events (avg/stddev):           171281.0000/0.00
    execution time (avg/stddev):   59.8608/0.00

