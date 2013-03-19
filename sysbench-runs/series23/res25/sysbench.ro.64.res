sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2100722
        write:                           0
        other:                           2100722
        total:                           4201444
    transactions:                        2100722 (35011.07 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2100722 (35011.07 per sec.)
    other operations:                    2100722 (35011.07 per sec.)

Test execution summary:
    total time:                          60.0017s
    total number of events:              2100722
    total time taken by event execution: 3836.6454
    per-request statistics:
         min:                                  1.23ms
         avg:                                  1.83ms
         max:                                 18.51ms
         approx.  95 percentile:               2.14ms

Threads fairness:
    events (avg/stddev):           32823.7812/21.00
    execution time (avg/stddev):   59.9476/0.00

