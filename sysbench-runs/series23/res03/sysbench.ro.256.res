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
        read:                            1006978
        write:                           0
        other:                           1006978
        total:                           2013956
    transactions:                        1006978 (16781.05 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1006978 (16781.05 per sec.)
    other operations:                    1006978 (16781.05 per sec.)

Test execution summary:
    total time:                          60.0068s
    total number of events:              1006978
    total time taken by event execution: 15353.2717
    per-request statistics:
         min:                                  1.75ms
         avg:                                 15.25ms
         max:                                115.10ms
         approx.  95 percentile:              28.17ms

Threads fairness:
    events (avg/stddev):           3933.5078/34.18
    execution time (avg/stddev):   59.9737/0.00

