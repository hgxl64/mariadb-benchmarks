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
        read:                            1334192
        write:                           0
        other:                           1334192
        total:                           2668384
    transactions:                        1334192 (22233.85 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1334192 (22233.85 per sec.)
    other operations:                    1334192 (22233.85 per sec.)

Test execution summary:
    total time:                          60.0072s
    total number of events:              1334192
    total time taken by event execution: 15353.0885
    per-request statistics:
         min:                                  1.74ms
         avg:                                 11.51ms
         max:                                105.17ms
         approx.  95 percentile:              26.70ms

Threads fairness:
    events (avg/stddev):           5211.6875/44.50
    execution time (avg/stddev):   59.9730/0.00

