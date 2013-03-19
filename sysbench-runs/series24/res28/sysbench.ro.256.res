sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1016016
        write:                           0
        other:                           1016016
        total:                           2032032
    transactions:                        1016016 (16929.83 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1016016 (16929.83 per sec.)
    other operations:                    1016016 (16929.83 per sec.)

Test execution summary:
    total time:                          60.0134s
    total number of events:              1016016
    total time taken by event execution: 15353.8256
    per-request statistics:
         min:                                  4.78ms
         avg:                                 15.11ms
         max:                                 70.79ms
         approx.  95 percentile:              23.08ms

Threads fairness:
    events (avg/stddev):           3968.8125/25.85
    execution time (avg/stddev):   59.9759/0.00

