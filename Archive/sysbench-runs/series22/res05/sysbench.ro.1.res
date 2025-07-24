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
        read:                            215874
        write:                           0
        other:                           215874
        total:                           431748
    transactions:                        215874 (3597.87 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 215874 (3597.87 per sec.)
    other operations:                    215874 (3597.87 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              215874
    total time taken by event execution: 59.8419
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.28ms
         max:                                  1.11ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           215874.0000/0.00
    execution time (avg/stddev):   59.8419/0.00

