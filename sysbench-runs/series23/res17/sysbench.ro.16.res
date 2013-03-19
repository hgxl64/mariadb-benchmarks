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
        read:                            1622841
        write:                           0
        other:                           1622841
        total:                           3245682
    transactions:                        1622841 (27046.96 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1622841 (27046.96 per sec.)
    other operations:                    1622841 (27046.96 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1622841
    total time taken by event execution: 957.5061
    per-request statistics:
         min:                                  0.20ms
         avg:                                  0.59ms
         max:                                  2.48ms
         approx.  95 percentile:               0.75ms

Threads fairness:
    events (avg/stddev):           101427.5625/248.10
    execution time (avg/stddev):   59.8441/0.01

