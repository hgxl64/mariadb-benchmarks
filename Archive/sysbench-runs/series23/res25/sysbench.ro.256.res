sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2099930
        write:                           0
        other:                           2099930
        total:                           4199860
    transactions:                        2099930 (34994.77 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2099930 (34994.77 per sec.)
    other operations:                    2099930 (34994.77 per sec.)

Test execution summary:
    total time:                          60.0070s
    total number of events:              2099930
    total time taken by event execution: 15351.7441
    per-request statistics:
         min:                                  1.27ms
         avg:                                  7.31ms
         max:                                 83.94ms
         approx.  95 percentile:              18.48ms

Threads fairness:
    events (avg/stddev):           8202.8516/64.59
    execution time (avg/stddev):   59.9678/0.00

