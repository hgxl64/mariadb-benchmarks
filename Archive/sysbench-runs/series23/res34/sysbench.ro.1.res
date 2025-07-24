sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            209939
        write:                           0
        other:                           209939
        total:                           419878
    transactions:                        209939 (3498.96 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 209939 (3498.96 per sec.)
    other operations:                    209939 (3498.96 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              209939
    total time taken by event execution: 59.8367
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.29ms
         max:                                  1.02ms
         approx.  95 percentile:               0.42ms

Threads fairness:
    events (avg/stddev):           209939.0000/0.00
    execution time (avg/stddev):   59.8367/0.00

