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
        read:                            873471
        write:                           0
        other:                           873471
        total:                           1746942
    transactions:                        873471 (14557.78 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 873471 (14557.78 per sec.)
    other operations:                    873471 (14557.78 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              873471
    total time taken by event execution: 238.6410
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.27ms
         max:                                  0.93ms
         approx.  95 percentile:               0.36ms

Threads fairness:
    events (avg/stddev):           218367.7500/24606.60
    execution time (avg/stddev):   59.6603/0.04

