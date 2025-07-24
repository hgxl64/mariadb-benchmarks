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
        read:                            678403
        write:                           0
        other:                           678403
        total:                           1356806
    transactions:                        678403 (11306.68 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 678403 (11306.68 per sec.)
    other operations:                    678403 (11306.68 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              678403
    total time taken by event execution: 119.0387
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.18ms
         max:                                  0.67ms
         approx.  95 percentile:               0.27ms

Threads fairness:
    events (avg/stddev):           339201.5000/80499.50
    execution time (avg/stddev):   59.5194/0.03

