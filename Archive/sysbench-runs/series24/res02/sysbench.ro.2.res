sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            795732
        write:                           0
        other:                           795732
        total:                           1591464
    transactions:                        795732 (13262.15 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 795732 (13262.15 per sec.)
    other operations:                    795732 (13262.15 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              795732
    total time taken by event execution: 118.7589
    per-request statistics:
         min:                                  0.10ms
         avg:                                  0.15ms
         max:                                  0.66ms
         approx.  95 percentile:               0.23ms

Threads fairness:
    events (avg/stddev):           397866.0000/111017.00
    execution time (avg/stddev):   59.3794/0.14

