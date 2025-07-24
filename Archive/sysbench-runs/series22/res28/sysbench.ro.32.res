sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1034710
        write:                           0
        other:                           1034710
        total:                           2069420
    transactions:                        1034710 (17244.71 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1034710 (17244.71 per sec.)
    other operations:                    1034710 (17244.71 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1034710
    total time taken by event execution: 1918.1857
    per-request statistics:
         min:                                  1.29ms
         avg:                                  1.85ms
         max:                                  4.10ms
         approx.  95 percentile:               2.08ms

Threads fairness:
    events (avg/stddev):           32334.6875/17.89
    execution time (avg/stddev):   59.9433/0.00

