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
        read:                            1841498
        write:                           0
        other:                           1841498
        total:                           3682996
    transactions:                        1841498 (30689.77 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1841498 (30689.77 per sec.)
    other operations:                    1841498 (30689.77 per sec.)

Test execution summary:
    total time:                          60.0036s
    total number of events:              1841498
    total time taken by event execution: 7676.0041
    per-request statistics:
         min:                                  1.37ms
         avg:                                  4.17ms
         max:                                 29.48ms
         approx.  95 percentile:               8.56ms

Threads fairness:
    events (avg/stddev):           14386.7031/65.55
    execution time (avg/stddev):   59.9688/0.00

