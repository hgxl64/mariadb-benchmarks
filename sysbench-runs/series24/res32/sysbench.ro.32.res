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
        read:                            1428444
        write:                           0
        other:                           1428444
        total:                           2856888
    transactions:                        1428444 (23807.04 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1428444 (23807.04 per sec.)
    other operations:                    1428444 (23807.04 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1428444
    total time taken by event execution: 1917.7021
    per-request statistics:
         min:                                  0.73ms
         avg:                                  1.34ms
         max:                                  3.98ms
         approx.  95 percentile:               1.60ms

Threads fairness:
    events (avg/stddev):           44638.8750/24.14
    execution time (avg/stddev):   59.9282/0.00

