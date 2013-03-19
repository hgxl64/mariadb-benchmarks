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
        read:                            699740
        write:                           0
        other:                           699740
        total:                           1399480
    transactions:                        699740 (11662.27 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 699740 (11662.27 per sec.)
    other operations:                    699740 (11662.27 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              699740
    total time taken by event execution: 238.7258
    per-request statistics:
         min:                                  0.20ms
         avg:                                  0.34ms
         max:                                  1.22ms
         approx.  95 percentile:               0.42ms

Threads fairness:
    events (avg/stddev):           174935.0000/2054.87
    execution time (avg/stddev):   59.6815/0.02

