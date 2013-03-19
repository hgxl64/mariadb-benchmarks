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
        read:                            1325423
        write:                           0
        other:                           1325423
        total:                           2650846
    transactions:                        1325423 (22089.75 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1325423 (22089.75 per sec.)
    other operations:                    1325423 (22089.75 per sec.)

Test execution summary:
    total time:                          60.0017s
    total number of events:              1325423
    total time taken by event execution: 3837.5196
    per-request statistics:
         min:                                  1.43ms
         avg:                                  2.90ms
         max:                                 10.30ms
         approx.  95 percentile:               3.47ms

Threads fairness:
    events (avg/stddev):           20709.7344/25.93
    execution time (avg/stddev):   59.9612/0.00

