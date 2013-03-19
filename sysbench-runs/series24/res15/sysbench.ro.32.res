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
        read:                            2584848
        write:                           0
        other:                           2584848
        total:                           5169696
    transactions:                        2584848 (43080.10 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2584848 (43080.10 per sec.)
    other operations:                    2584848 (43080.10 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              2584848
    total time taken by event execution: 1916.1058
    per-request statistics:
         min:                                  0.34ms
         avg:                                  0.74ms
         max:                                  4.97ms
         approx.  95 percentile:               0.91ms

Threads fairness:
    events (avg/stddev):           80776.5000/266.87
    execution time (avg/stddev):   59.8783/0.00

