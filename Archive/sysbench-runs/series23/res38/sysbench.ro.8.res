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
        read:                            1172614
        write:                           0
        other:                           1172614
        total:                           2345228
    transactions:                        1172614 (19543.39 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1172614 (19543.39 per sec.)
    other operations:                    1172614 (19543.39 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1172614
    total time taken by event execution: 478.2676
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.41ms
         max:                                  1.53ms
         approx.  95 percentile:               0.54ms

Threads fairness:
    events (avg/stddev):           146576.7500/5757.63
    execution time (avg/stddev):   59.7835/0.01

