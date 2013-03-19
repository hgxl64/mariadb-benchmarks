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
        read:                            333814
        write:                           0
        other:                           333814
        total:                           667628
    transactions:                        333814 (5563.54 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 333814 (5563.54 per sec.)
    other operations:                    333814 (5563.54 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              333814
    total time taken by event execution: 119.2752
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.36ms
         max:                                  0.90ms
         approx.  95 percentile:               0.47ms

Threads fairness:
    events (avg/stddev):           166907.0000/1080.00
    execution time (avg/stddev):   59.6376/0.01

