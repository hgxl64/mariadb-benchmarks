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
        read:                            1954905
        write:                           0
        other:                           1954905
        total:                           3909810
    transactions:                        1954905 (32578.21 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1954905 (32578.21 per sec.)
    other operations:                    1954905 (32578.21 per sec.)

Test execution summary:
    total time:                          60.0065s
    total number of events:              1954905
    total time taken by event execution: 15351.1389
    per-request statistics:
         min:                                  1.27ms
         avg:                                  7.85ms
         max:                                 80.67ms
         approx.  95 percentile:              19.89ms

Threads fairness:
    events (avg/stddev):           7636.3477/56.64
    execution time (avg/stddev):   59.9654/0.00

