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
        read:                            213466
        write:                           0
        other:                           213466
        total:                           426932
    transactions:                        213466 (3557.74 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 213466 (3557.74 per sec.)
    other operations:                    213466 (3557.74 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              213466
    total time taken by event execution: 59.8471
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.28ms
         max:                                  0.88ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           213466.0000/0.00
    execution time (avg/stddev):   59.8471/0.00

