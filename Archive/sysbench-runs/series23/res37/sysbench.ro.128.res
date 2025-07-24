sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1580772
        write:                           0
        other:                           1580772
        total:                           3161544
    transactions:                        1580772 (26344.58 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1580772 (26344.58 per sec.)
    other operations:                    1580772 (26344.58 per sec.)

Test execution summary:
    total time:                          60.0037s
    total number of events:              1580772
    total time taken by event execution: 7676.2379
    per-request statistics:
         min:                                  1.60ms
         avg:                                  4.86ms
         max:                                 32.12ms
         approx.  95 percentile:               9.76ms

Threads fairness:
    events (avg/stddev):           12349.7812/48.01
    execution time (avg/stddev):   59.9706/0.00

