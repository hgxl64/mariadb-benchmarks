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
        read:                            166421
        write:                           0
        other:                           166421
        total:                           332842
    transactions:                        166421 (2773.67 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 166421 (2773.67 per sec.)
    other operations:                    166421 (2773.67 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              166421
    total time taken by event execution: 59.8208
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.36ms
         max:                                  0.73ms
         approx.  95 percentile:               0.44ms

Threads fairness:
    events (avg/stddev):           166421.0000/0.00
    execution time (avg/stddev):   59.8208/0.00

