sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1547952
        write:                           0
        other:                           1547952
        total:                           3095904
    transactions:                        1547952 (25798.80 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1547952 (25798.80 per sec.)
    other operations:                    1547952 (25798.80 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1547952
    total time taken by event execution: 1917.3244
    per-request statistics:
         min:                                  0.54ms
         avg:                                  1.24ms
         max:                                  5.25ms
         approx.  95 percentile:               1.56ms

Threads fairness:
    events (avg/stddev):           48373.5000/116.21
    execution time (avg/stddev):   59.9164/0.00

