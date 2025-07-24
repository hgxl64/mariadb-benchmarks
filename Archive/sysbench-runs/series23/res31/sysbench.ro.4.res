sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            932037
        write:                           0
        other:                           932037
        total:                           1864074
    transactions:                        932037 (15533.86 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 932037 (15533.86 per sec.)
    other operations:                    932037 (15533.86 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              932037
    total time taken by event execution: 238.5357
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.26ms
         max:                                  1.55ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           233009.2500/26369.15
    execution time (avg/stddev):   59.6339/0.07

