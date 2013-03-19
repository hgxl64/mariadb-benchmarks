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
        read:                            1188272
        write:                           0
        other:                           1188272
        total:                           2376544
    transactions:                        1188272 (19804.36 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1188272 (19804.36 per sec.)
    other operations:                    1188272 (19804.36 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1188272
    total time taken by event execution: 478.2880
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.40ms
         max:                                  1.33ms
         approx.  95 percentile:               0.52ms

Threads fairness:
    events (avg/stddev):           148534.0000/1094.39
    execution time (avg/stddev):   59.7860/0.02

