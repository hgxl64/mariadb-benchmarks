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
        read:                            1390999
        write:                           0
        other:                           1390999
        total:                           2781998
    transactions:                        1390999 (23180.82 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1390999 (23180.82 per sec.)
    other operations:                    1390999 (23180.82 per sec.)

Test execution summary:
    total time:                          60.0065s
    total number of events:              1390999
    total time taken by event execution: 15354.4414
    per-request statistics:
         min:                                  1.62ms
         avg:                                 11.04ms
         max:                                102.96ms
         approx.  95 percentile:              25.73ms

Threads fairness:
    events (avg/stddev):           5433.5898/39.70
    execution time (avg/stddev):   59.9783/0.00

