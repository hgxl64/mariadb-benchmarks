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
        read:                            1099913
        write:                           0
        other:                           1099913
        total:                           2199826
    transactions:                        1099913 (18331.68 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1099913 (18331.68 per sec.)
    other operations:                    1099913 (18331.68 per sec.)

Test execution summary:
    total time:                          60.0007s
    total number of events:              1099913
    total time taken by event execution: 958.1269
    per-request statistics:
         min:                                  0.27ms
         avg:                                  0.87ms
         max:                                  2.29ms
         approx.  95 percentile:               1.13ms

Threads fairness:
    events (avg/stddev):           68744.5625/815.96
    execution time (avg/stddev):   59.8829/0.00

