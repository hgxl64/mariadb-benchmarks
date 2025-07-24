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
        read:                            1337419
        write:                           0
        other:                           1337419
        total:                           2674838
    transactions:                        1337419 (22289.67 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1337419 (22289.67 per sec.)
    other operations:                    1337419 (22289.67 per sec.)

Test execution summary:
    total time:                          60.0017s
    total number of events:              1337419
    total time taken by event execution: 3837.4794
    per-request statistics:
         min:                                  1.57ms
         avg:                                  2.87ms
         max:                                  8.53ms
         approx.  95 percentile:               3.45ms

Threads fairness:
    events (avg/stddev):           20897.1719/26.41
    execution time (avg/stddev):   59.9606/0.00

