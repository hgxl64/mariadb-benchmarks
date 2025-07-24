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
        read:                            2202400
        write:                           0
        other:                           2202400
        total:                           4404800
    transactions:                        2202400 (36706.26 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2202400 (36706.26 per sec.)
    other operations:                    2202400 (36706.26 per sec.)

Test execution summary:
    total time:                          60.0007s
    total number of events:              2202400
    total time taken by event execution: 956.9189
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.43ms
         max:                                 13.43ms
         approx.  95 percentile:               0.57ms

Threads fairness:
    events (avg/stddev):           137650.0000/2587.90
    execution time (avg/stddev):   59.8074/0.01

