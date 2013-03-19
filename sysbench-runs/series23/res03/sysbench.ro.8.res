sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1631216
        write:                           0
        other:                           1631216
        total:                           3262432
    transactions:                        1631216 (27186.77 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1631216 (27186.77 per sec.)
    other operations:                    1631216 (27186.77 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1631216
    total time taken by event execution: 477.3482
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.29ms
         max:                                  1.44ms
         approx.  95 percentile:               0.36ms

Threads fairness:
    events (avg/stddev):           203902.0000/4434.79
    execution time (avg/stddev):   59.6685/0.02

