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
        read:                            404003
        write:                           0
        other:                           404003
        total:                           808006
    transactions:                        404003 (6733.36 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 404003 (6733.36 per sec.)
    other operations:                    404003 (6733.36 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              404003
    total time taken by event execution: 119.4481
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.30ms
         max:                                  0.86ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           202001.5000/371.50
    execution time (avg/stddev):   59.7241/0.01

