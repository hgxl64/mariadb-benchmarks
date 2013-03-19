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
        read:                            190418
        write:                           0
        other:                           190418
        total:                           380836
    transactions:                        190418 (3173.61 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 190418 (3173.61 per sec.)
    other operations:                    190418 (3173.61 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              190418
    total time taken by event execution: 59.8437
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.31ms
         max:                                  0.70ms
         approx.  95 percentile:               0.43ms

Threads fairness:
    events (avg/stddev):           190418.0000/0.00
    execution time (avg/stddev):   59.8437/0.00

