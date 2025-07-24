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
        read:                            765007
        write:                           0
        other:                           765007
        total:                           1530014
    transactions:                        765007 (12750.05 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 765007 (12750.05 per sec.)
    other operations:                    765007 (12750.05 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              765007
    total time taken by event execution: 119.4559
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.16ms
         max:                                  6.98ms
         approx.  95 percentile:               0.26ms

Threads fairness:
    events (avg/stddev):           382503.5000/11.50
    execution time (avg/stddev):   59.7279/0.00

