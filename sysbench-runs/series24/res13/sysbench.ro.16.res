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
        read:                            1403008
        write:                           0
        other:                           1403008
        total:                           2806016
    transactions:                        1403008 (23383.22 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1403008 (23383.22 per sec.)
    other operations:                    1403008 (23383.22 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1403008
    total time taken by event execution: 957.8394
    per-request statistics:
         min:                                  0.24ms
         avg:                                  0.68ms
         max:                                  2.88ms
         approx.  95 percentile:               0.87ms

Threads fairness:
    events (avg/stddev):           87688.0000/1085.98
    execution time (avg/stddev):   59.8650/0.01

