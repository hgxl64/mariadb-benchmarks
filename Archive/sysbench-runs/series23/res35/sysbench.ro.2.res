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
        read:                            457189
        write:                           0
        other:                           457189
        total:                           914378
    transactions:                        457189 (7619.79 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 457189 (7619.79 per sec.)
    other operations:                    457189 (7619.79 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              457189
    total time taken by event execution: 119.4609
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.26ms
         max:                                  0.78ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           228594.5000/12560.50
    execution time (avg/stddev):   59.7305/0.02

