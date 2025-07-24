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
        read:                            251266
        write:                           0
        other:                           251266
        total:                           502532
    transactions:                        251266 (4187.75 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 251266 (4187.75 per sec.)
    other operations:                    251266 (4187.75 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              251266
    total time taken by event execution: 59.8319
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.24ms
         max:                                  7.94ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           251266.0000/0.00
    execution time (avg/stddev):   59.8319/0.00

