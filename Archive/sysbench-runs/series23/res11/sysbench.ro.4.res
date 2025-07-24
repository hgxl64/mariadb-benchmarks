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
        read:                            861769
        write:                           0
        other:                           861769
        total:                           1723538
    transactions:                        861769 (14362.70 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 861769 (14362.70 per sec.)
    other operations:                    861769 (14362.70 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              861769
    total time taken by event execution: 238.6783
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.28ms
         max:                                  1.12ms
         approx.  95 percentile:               0.37ms

Threads fairness:
    events (avg/stddev):           215442.2500/15040.99
    execution time (avg/stddev):   59.6696/0.04

