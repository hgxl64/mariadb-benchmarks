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
        read:                            551614
        write:                           0
        other:                           551614
        total:                           1103228
    transactions:                        551614 (9193.51 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 551614 (9193.51 per sec.)
    other operations:                    551614 (9193.51 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              551614
    total time taken by event execution: 119.1478
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.22ms
         max:                                 13.14ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           275807.0000/50142.00
    execution time (avg/stddev):   59.5739/0.05

