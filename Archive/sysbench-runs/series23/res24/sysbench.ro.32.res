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
        read:                            1071390
        write:                           0
        other:                           1071390
        total:                           2142780
    transactions:                        1071390 (17855.95 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1071390 (17855.95 per sec.)
    other operations:                    1071390 (17855.95 per sec.)

Test execution summary:
    total time:                          60.0019s
    total number of events:              1071390
    total time taken by event execution: 1918.1858
    per-request statistics:
         min:                                  1.27ms
         avg:                                  1.79ms
         max:                                  4.86ms
         approx.  95 percentile:               2.02ms

Threads fairness:
    events (avg/stddev):           33480.9375/24.38
    execution time (avg/stddev):   59.9433/0.00

