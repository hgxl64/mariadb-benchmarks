sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            971363
        write:                           0
        other:                           971363
        total:                           1942726
    transactions:                        971363 (16189.30 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 971363 (16189.30 per sec.)
    other operations:                    971363 (16189.30 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              971363
    total time taken by event execution: 238.4420
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.25ms
         max:                                  0.77ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           242840.7500/39144.41
    execution time (avg/stddev):   59.6105/0.08

