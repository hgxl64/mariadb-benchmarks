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
        read:                            166647
        write:                           0
        other:                           166647
        total:                           333294
    transactions:                        166647 (2777.44 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 166647 (2777.44 per sec.)
    other operations:                    166647 (2777.44 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              166647
    total time taken by event execution: 59.7925
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.36ms
         max:                                  0.74ms
         approx.  95 percentile:               0.42ms

Threads fairness:
    events (avg/stddev):           166647.0000/0.00
    execution time (avg/stddev):   59.7925/0.00

