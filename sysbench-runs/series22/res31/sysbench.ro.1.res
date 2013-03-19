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
        read:                            181950
        write:                           0
        other:                           181950
        total:                           363900
    transactions:                        181950 (3032.49 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 181950 (3032.49 per sec.)
    other operations:                    181950 (3032.49 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              181950
    total time taken by event execution: 59.8418
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.33ms
         max:                                  0.80ms
         approx.  95 percentile:               0.44ms

Threads fairness:
    events (avg/stddev):           181950.0000/0.00
    execution time (avg/stddev):   59.8418/0.00

