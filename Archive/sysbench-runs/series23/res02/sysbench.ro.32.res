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
        read:                            1430974
        write:                           0
        other:                           1430974
        total:                           2861948
    transactions:                        1430974 (23849.28 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1430974 (23849.28 per sec.)
    other operations:                    1430974 (23849.28 per sec.)

Test execution summary:
    total time:                          60.0007s
    total number of events:              1430974
    total time taken by event execution: 1917.5886
    per-request statistics:
         min:                                  0.60ms
         avg:                                  1.34ms
         max:                                  3.44ms
         approx.  95 percentile:               1.65ms

Threads fairness:
    events (avg/stddev):           44717.9375/75.80
    execution time (avg/stddev):   59.9246/0.00

