sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            770997
        write:                           0
        other:                           770997
        total:                           1541994
    transactions:                        770997 (12849.84 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 770997 (12849.84 per sec.)
    other operations:                    770997 (12849.84 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              770997
    total time taken by event execution: 238.6409
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.31ms
         max:                                  0.99ms
         approx.  95 percentile:               0.42ms

Threads fairness:
    events (avg/stddev):           192749.2500/1688.07
    execution time (avg/stddev):   59.6602/0.01

