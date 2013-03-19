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
        read:                            2478704
        write:                           0
        other:                           2478704
        total:                           4957408
    transactions:                        2478704 (41308.60 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2478704 (41308.60 per sec.)
    other operations:                    2478704 (41308.60 per sec.)

Test execution summary:
    total time:                          60.0046s
    total number of events:              2478704
    total time taken by event execution: 7674.4203
    per-request statistics:
         min:                                  1.06ms
         avg:                                  3.10ms
         max:                                 28.01ms
         approx.  95 percentile:               6.51ms

Threads fairness:
    events (avg/stddev):           19364.8750/104.13
    execution time (avg/stddev):   59.9564/0.00

