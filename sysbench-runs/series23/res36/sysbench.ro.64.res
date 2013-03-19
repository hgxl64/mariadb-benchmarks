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
        read:                            1669287
        write:                           0
        other:                           1669287
        total:                           3338574
    transactions:                        1669287 (27820.69 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1669287 (27820.69 per sec.)
    other operations:                    1669287 (27820.69 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1669287
    total time taken by event execution: 3837.2207
    per-request statistics:
         min:                                  1.47ms
         avg:                                  2.30ms
         max:                                 18.99ms
         approx.  95 percentile:               2.72ms

Threads fairness:
    events (avg/stddev):           26082.6094/19.14
    execution time (avg/stddev):   59.9566/0.00

