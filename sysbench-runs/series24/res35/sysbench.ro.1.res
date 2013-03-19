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
        read:                            261325
        write:                           0
        other:                           261325
        total:                           522650
    transactions:                        261325 (4355.39 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 261325 (4355.39 per sec.)
    other operations:                    261325 (4355.39 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              261325
    total time taken by event execution: 59.8174
    per-request statistics:
         min:                                  0.10ms
         avg:                                  0.23ms
         max:                                  0.77ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           261325.0000/0.00
    execution time (avg/stddev):   59.8174/0.00

