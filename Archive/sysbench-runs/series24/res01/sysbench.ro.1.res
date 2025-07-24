sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            542614
        write:                           0
        other:                           542614
        total:                           1085228
    transactions:                        542614 (9043.53 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 542614 (9043.53 per sec.)
    other operations:                    542614 (9043.53 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              542614
    total time taken by event execution: 59.6909
    per-request statistics:
         min:                                  0.10ms
         avg:                                  0.11ms
         max:                                  0.92ms
         approx.  95 percentile:               0.12ms

Threads fairness:
    events (avg/stddev):           542614.0000/0.00
    execution time (avg/stddev):   59.6909/0.00

