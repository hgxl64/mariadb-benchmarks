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
        read:                            701961
        write:                           0
        other:                           701961
        total:                           1403922
    transactions:                        701961 (11699.25 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 701961 (11699.25 per sec.)
    other operations:                    701961 (11699.25 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              701961
    total time taken by event execution: 238.7679
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.34ms
         max:                                  1.44ms
         approx.  95 percentile:               0.44ms

Threads fairness:
    events (avg/stddev):           175490.2500/8956.35
    execution time (avg/stddev):   59.6920/0.02

