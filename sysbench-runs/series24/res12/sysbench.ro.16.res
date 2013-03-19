sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1472626
        write:                           0
        other:                           1472626
        total:                           2945252
    transactions:                        1472626 (24543.56 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1472626 (24543.56 per sec.)
    other operations:                    1472626 (24543.56 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1472626
    total time taken by event execution: 957.5635
    per-request statistics:
         min:                                  0.20ms
         avg:                                  0.65ms
         max:                                  2.69ms
         approx.  95 percentile:               0.83ms

Threads fairness:
    events (avg/stddev):           92039.1250/1337.60
    execution time (avg/stddev):   59.8477/0.01

