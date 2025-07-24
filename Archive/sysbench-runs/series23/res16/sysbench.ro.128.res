sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1678269
        write:                           0
        other:                           1678269
        total:                           3356538
    transactions:                        1678269 (27969.44 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1678269 (27969.44 per sec.)
    other operations:                    1678269 (27969.44 per sec.)

Test execution summary:
    total time:                          60.0037s
    total number of events:              1678269
    total time taken by event execution: 7675.9864
    per-request statistics:
         min:                                  1.55ms
         avg:                                  4.57ms
         max:                                 36.02ms
         approx.  95 percentile:               9.34ms

Threads fairness:
    events (avg/stddev):           13111.4766/75.84
    execution time (avg/stddev):   59.9686/0.00

