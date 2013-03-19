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
        read:                            740191
        write:                           0
        other:                           740191
        total:                           1480382
    transactions:                        740191 (12336.41 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 740191 (12336.41 per sec.)
    other operations:                    740191 (12336.41 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              740191
    total time taken by event execution: 238.8636
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.32ms
         max:                                  1.34ms
         approx.  95 percentile:               0.40ms

Threads fairness:
    events (avg/stddev):           185047.7500/1922.73
    execution time (avg/stddev):   59.7159/0.03

