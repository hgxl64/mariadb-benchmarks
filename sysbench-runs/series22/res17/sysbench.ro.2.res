sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            435793
        write:                           0
        other:                           435793
        total:                           871586
    transactions:                        435793 (7263.18 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 435793 (7263.18 per sec.)
    other operations:                    435793 (7263.18 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              435793
    total time taken by event execution: 119.4284
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.27ms
         max:                                 17.39ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           217896.5000/217.50
    execution time (avg/stddev):   59.7142/0.01

