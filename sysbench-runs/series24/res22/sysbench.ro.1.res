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
        read:                            197613
        write:                           0
        other:                           197613
        total:                           395226
    transactions:                        197613 (3293.54 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 197613 (3293.54 per sec.)
    other operations:                    197613 (3293.54 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              197613
    total time taken by event execution: 59.8333
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.30ms
         max:                                  0.84ms
         approx.  95 percentile:               0.42ms

Threads fairness:
    events (avg/stddev):           197613.0000/0.00
    execution time (avg/stddev):   59.8333/0.00

