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
        read:                            2394570
        write:                           0
        other:                           2394570
        total:                           4789140
    transactions:                        2394570 (39907.24 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2394570 (39907.24 per sec.)
    other operations:                    2394570 (39907.24 per sec.)

Test execution summary:
    total time:                          60.0034s
    total number of events:              2394570
    total time taken by event execution: 7674.9934
    per-request statistics:
         min:                                  1.07ms
         avg:                                  3.21ms
         max:                                 30.83ms
         approx.  95 percentile:               6.70ms

Threads fairness:
    events (avg/stddev):           18707.5781/90.52
    execution time (avg/stddev):   59.9609/0.00

