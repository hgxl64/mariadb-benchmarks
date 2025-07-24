sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1514964
        write:                           0
        other:                           1514964
        total:                           3029928
    transactions:                        1514964 (25249.19 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1514964 (25249.19 per sec.)
    other operations:                    1514964 (25249.19 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1514964
    total time taken by event execution: 477.6916
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.32ms
         max:                                  5.45ms
         approx.  95 percentile:               0.43ms

Threads fairness:
    events (avg/stddev):           189370.5000/6395.59
    execution time (avg/stddev):   59.7114/0.01

