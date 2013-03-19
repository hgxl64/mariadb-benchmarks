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
        read:                            535853
        write:                           0
        other:                           535853
        total:                           1071706
    transactions:                        535853 (8930.83 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 535853 (8930.83 per sec.)
    other operations:                    535853 (8930.83 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              535853
    total time taken by event execution: 119.2189
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.22ms
         max:                                  0.80ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           267926.5000/32331.50
    execution time (avg/stddev):   59.6095/0.03

