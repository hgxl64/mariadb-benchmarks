sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2408215
        write:                           0
        other:                           2408215
        total:                           4816430
    transactions:                        2408215 (40134.43 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2408215 (40134.43 per sec.)
    other operations:                    2408215 (40134.43 per sec.)

Test execution summary:
    total time:                          60.0037s
    total number of events:              2408215
    total time taken by event execution: 7675.0746
    per-request statistics:
         min:                                  1.09ms
         avg:                                  3.19ms
         max:                                 27.06ms
         approx.  95 percentile:               6.66ms

Threads fairness:
    events (avg/stddev):           18814.1797/88.59
    execution time (avg/stddev):   59.9615/0.00

