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
        read:                            892479
        write:                           0
        other:                           892479
        total:                           1784958
    transactions:                        892479 (14874.60 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 892479 (14874.60 per sec.)
    other operations:                    892479 (14874.60 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              892479
    total time taken by event execution: 238.6738
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.27ms
         max:                                  1.17ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           223119.7500/3827.27
    execution time (avg/stddev):   59.6685/0.01

