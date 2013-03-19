sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1578522
        write:                           0
        other:                           1578522
        total:                           3157044
    transactions:                        1578522 (26307.96 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1578522 (26307.96 per sec.)
    other operations:                    1578522 (26307.96 per sec.)

Test execution summary:
    total time:                          60.0017s
    total number of events:              1578522
    total time taken by event execution: 3837.1628
    per-request statistics:
         min:                                  1.50ms
         avg:                                  2.43ms
         max:                                 10.89ms
         approx.  95 percentile:               2.88ms

Threads fairness:
    events (avg/stddev):           24664.4062/15.87
    execution time (avg/stddev):   59.9557/0.00

