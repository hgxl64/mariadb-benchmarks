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
        read:                            647303
        write:                           0
        other:                           647303
        total:                           1294606
    transactions:                        647303 (10788.35 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 647303 (10788.35 per sec.)
    other operations:                    647303 (10788.35 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              647303
    total time taken by event execution: 119.0170
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.18ms
         max:                                  0.66ms
         approx.  95 percentile:               0.27ms

Threads fairness:
    events (avg/stddev):           323651.5000/43203.50
    execution time (avg/stddev):   59.5085/0.03

