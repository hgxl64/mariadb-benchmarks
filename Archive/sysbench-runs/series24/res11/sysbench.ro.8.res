sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1574867
        write:                           0
        other:                           1574867
        total:                           3149734
    transactions:                        1574867 (26247.61 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1574867 (26247.61 per sec.)
    other operations:                    1574867 (26247.61 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1574867
    total time taken by event execution: 477.7491
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.30ms
         max:                                  5.70ms
         approx.  95 percentile:               0.42ms

Threads fairness:
    events (avg/stddev):           196858.3750/6255.32
    execution time (avg/stddev):   59.7186/0.01

