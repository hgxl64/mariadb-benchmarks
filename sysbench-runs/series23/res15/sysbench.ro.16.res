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
        read:                            2222663
        write:                           0
        other:                           2222663
        total:                           4445326
    transactions:                        2222663 (37044.15 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2222663 (37044.15 per sec.)
    other operations:                    2222663 (37044.15 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              2222663
    total time taken by event execution: 956.8333
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.43ms
         max:                                  4.86ms
         approx.  95 percentile:               0.56ms

Threads fairness:
    events (avg/stddev):           138916.4375/1344.49
    execution time (avg/stddev):   59.8021/0.01

