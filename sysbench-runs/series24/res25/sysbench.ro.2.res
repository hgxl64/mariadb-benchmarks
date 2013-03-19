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
        read:                            532307
        write:                           0
        other:                           532307
        total:                           1064614
    transactions:                        532307 (8871.73 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 532307 (8871.73 per sec.)
    other operations:                    532307 (8871.73 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              532307
    total time taken by event execution: 119.1702
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.22ms
         max:                                  0.62ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           266153.5000/34495.50
    execution time (avg/stddev):   59.5851/0.03

