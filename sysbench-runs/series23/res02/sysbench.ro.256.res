sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1296768
        write:                           0
        other:                           1296768
        total:                           2593536
    transactions:                        1296768 (21610.53 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1296768 (21610.53 per sec.)
    other operations:                    1296768 (21610.53 per sec.)

Test execution summary:
    total time:                          60.0063s
    total number of events:              1296768
    total time taken by event execution: 15352.8135
    per-request statistics:
         min:                                  1.53ms
         avg:                                 11.84ms
         max:                                 96.84ms
         approx.  95 percentile:              23.16ms

Threads fairness:
    events (avg/stddev):           5065.5000/44.17
    execution time (avg/stddev):   59.9719/0.00

