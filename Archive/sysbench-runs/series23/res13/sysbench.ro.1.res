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
        read:                            164577
        write:                           0
        other:                           164577
        total:                           329154
    transactions:                        164577 (2742.94 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 164577 (2742.94 per sec.)
    other operations:                    164577 (2742.94 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              164577
    total time taken by event execution: 59.8298
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.36ms
         max:                                  0.76ms
         approx.  95 percentile:               0.47ms

Threads fairness:
    events (avg/stddev):           164577.0000/0.00
    execution time (avg/stddev):   59.8298/0.00

