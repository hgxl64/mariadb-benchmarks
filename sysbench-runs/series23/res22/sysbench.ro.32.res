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
        read:                            1378817
        write:                           0
        other:                           1378817
        total:                           2757634
    transactions:                        1378817 (22979.84 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1378817 (22979.84 per sec.)
    other operations:                    1378817 (22979.84 per sec.)

Test execution summary:
    total time:                          60.0012s
    total number of events:              1378817
    total time taken by event execution: 1917.6920
    per-request statistics:
         min:                                  0.58ms
         avg:                                  1.39ms
         max:                                  2.87ms
         approx.  95 percentile:               1.65ms

Threads fairness:
    events (avg/stddev):           43088.0312/60.32
    execution time (avg/stddev):   59.9279/0.00

