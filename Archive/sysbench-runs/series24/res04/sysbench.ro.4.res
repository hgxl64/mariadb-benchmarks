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
        read:                            805897
        write:                           0
        other:                           805897
        total:                           1611794
    transactions:                        805897 (13431.43 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 805897 (13431.43 per sec.)
    other operations:                    805897 (13431.43 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              805897
    total time taken by event execution: 238.5595
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.30ms
         max:                                  1.24ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           201474.2500/6789.42
    execution time (avg/stddev):   59.6399/0.02

