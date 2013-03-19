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
        read:                            2425159
        write:                           0
        other:                           2425159
        total:                           4850318
    transactions:                        2425159 (40418.34 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2425159 (40418.34 per sec.)
    other operations:                    2425159 (40418.34 per sec.)

Test execution summary:
    total time:                          60.0014s
    total number of events:              2425159
    total time taken by event execution: 3835.9567
    per-request statistics:
         min:                                  1.02ms
         avg:                                  1.58ms
         max:                                  6.07ms
         approx.  95 percentile:               1.88ms

Threads fairness:
    events (avg/stddev):           37893.1094/31.56
    execution time (avg/stddev):   59.9368/0.00

