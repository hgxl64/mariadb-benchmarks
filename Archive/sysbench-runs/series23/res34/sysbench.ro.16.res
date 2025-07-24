sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1111618
        write:                           0
        other:                           1111618
        total:                           2223236
    transactions:                        1111618 (18526.68 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1111618 (18526.68 per sec.)
    other operations:                    1111618 (18526.68 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1111618
    total time taken by event execution: 958.0048
    per-request statistics:
         min:                                  0.43ms
         avg:                                  0.86ms
         max:                                  2.50ms
         approx.  95 percentile:               1.02ms

Threads fairness:
    events (avg/stddev):           69476.1250/1042.32
    execution time (avg/stddev):   59.8753/0.01

