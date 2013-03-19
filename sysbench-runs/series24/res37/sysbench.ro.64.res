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
        read:                            1834098
        write:                           0
        other:                           1834098
        total:                           3668196
    transactions:                        1834098 (30567.38 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1834098 (30567.38 per sec.)
    other operations:                    1834098 (30567.38 per sec.)

Test execution summary:
    total time:                          60.0018s
    total number of events:              1834098
    total time taken by event execution: 3836.8399
    per-request statistics:
         min:                                  1.35ms
         avg:                                  2.09ms
         max:                                 11.81ms
         approx.  95 percentile:               2.50ms

Threads fairness:
    events (avg/stddev):           28657.7812/21.80
    execution time (avg/stddev):   59.9506/0.00

