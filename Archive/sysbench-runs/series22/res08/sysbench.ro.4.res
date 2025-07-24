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
        read:                            994675
        write:                           0
        other:                           994675
        total:                           1989350
    transactions:                        994675 (16577.79 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 994675 (16577.79 per sec.)
    other operations:                    994675 (16577.79 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              994675
    total time taken by event execution: 238.2717
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.24ms
         max:                                  1.53ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           248668.7500/36774.14
    execution time (avg/stddev):   59.5679/0.09

