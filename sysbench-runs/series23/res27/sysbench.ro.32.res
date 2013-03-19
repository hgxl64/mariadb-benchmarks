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
        read:                            1626410
        write:                           0
        other:                           1626410
        total:                           3252820
    transactions:                        1626410 (27106.38 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1626410 (27106.38 per sec.)
    other operations:                    1626410 (27106.38 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              1626410
    total time taken by event execution: 1917.4877
    per-request statistics:
         min:                                  0.70ms
         avg:                                  1.18ms
         max:                                 14.00ms
         approx.  95 percentile:               1.39ms

Threads fairness:
    events (avg/stddev):           50825.3125/32.00
    execution time (avg/stddev):   59.9215/0.00

