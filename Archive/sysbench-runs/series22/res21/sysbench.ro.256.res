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
        read:                            1672020
        write:                           0
        other:                           1672020
        total:                           3344040
    transactions:                        1672020 (27863.98 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1672020 (27863.98 per sec.)
    other operations:                    1672020 (27863.98 per sec.)

Test execution summary:
    total time:                          60.0065s
    total number of events:              1672020
    total time taken by event execution: 15352.2809
    per-request statistics:
         min:                                  1.49ms
         avg:                                  9.18ms
         max:                                 86.57ms
         approx.  95 percentile:              22.66ms

Threads fairness:
    events (avg/stddev):           6531.3281/52.32
    execution time (avg/stddev):   59.9698/0.00

