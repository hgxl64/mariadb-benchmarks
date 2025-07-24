sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1991880
        write:                           0
        other:                           1991880
        total:                           3983760
    transactions:                        1991880 (33197.72 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1991880 (33197.72 per sec.)
    other operations:                    1991880 (33197.72 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1991880
    total time taken by event execution: 956.4982
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.48ms
         max:                                  2.73ms
         approx.  95 percentile:               0.75ms

Threads fairness:
    events (avg/stddev):           124492.5000/1923.56
    execution time (avg/stddev):   59.7811/0.01

