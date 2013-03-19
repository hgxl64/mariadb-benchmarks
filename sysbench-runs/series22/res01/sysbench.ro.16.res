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
        read:                            2150164
        write:                           0
        other:                           2150164
        total:                           4300328
    transactions:                        2150164 (35835.78 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2150164 (35835.78 per sec.)
    other operations:                    2150164 (35835.78 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              2150164
    total time taken by event execution: 956.6675
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.44ms
         max:                                  2.47ms
         approx.  95 percentile:               0.60ms

Threads fairness:
    events (avg/stddev):           134385.2500/1822.52
    execution time (avg/stddev):   59.7917/0.01

